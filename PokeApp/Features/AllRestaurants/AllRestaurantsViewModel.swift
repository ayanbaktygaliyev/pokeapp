import Foundation
import SwiftUI
import Combine

class AllRestaurantsViewModel: ObservableObject {
    struct State {
        var restaurants: [Restaurant] = []
        var searchText: String = ""
        var filteredRestaurants: [Restaurant] {
            if searchText.isEmpty {
                return restaurants
            }
            
            return restaurants.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        var favorites: [Restaurant] = []
    }
    
    @Published
    var state = State()
    
    let restaurantsRepository: RestaurantsRepository
    let userRepository: UserRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(restaurantsRepository: RestaurantsRepository, userRepository: UserRepository) {
        self.restaurantsRepository = restaurantsRepository
        self.userRepository = userRepository
        loadAllRestaurants()
        loadUserFavoriteRestaurants()
    }
    
    func reload() {
        loadUserFavoriteRestaurants()
    }
    
    func loadAllRestaurants() {
        restaurantsRepository.loadAllRestaurants()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let restaurants):
                    self?.state.restaurants = restaurants
                    
                case .failure(let error):
                    print(#line, #file)
                    print(String(describing: error))
                }
            }
            .store(in: &cancellables)
    }
    
    func loadUserFavoriteRestaurants() {
        restaurantsRepository.getFavoriteRestaurants(login: userRepository.username)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let restaurants):
                    self?.state.favorites = restaurants
                    
                case .failure(let error):
                    print(#line, #file)
                    print(String(describing: error))
                }
            }
            .store(in: &cancellables)
    }
    
    func heartAction(restaurantID: String, completion: @escaping () -> Void) {
        let publisher = state.favorites.contains { $0.id == restaurantID } ?
            restaurantsRepository.removeFavorite(login: userRepository.username, restaurantID: restaurantID) :
            restaurantsRepository.addFavorite(login: userRepository.username, restaurantID: restaurantID)
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print(#line, #file)
                    print(String(describing: error))
                }
            }
            .store(in: &cancellables)
    }
    
    func heartImage(restaurantID: String) -> String {
        state.favorites.contains { $0.id == restaurantID } ? "heart.fill" : "heart"
    }
}

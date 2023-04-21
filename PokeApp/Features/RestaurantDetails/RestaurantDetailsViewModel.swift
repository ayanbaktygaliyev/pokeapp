import Foundation
import SwiftUI
import Combine

final class RestaurantDetailsViewModel: ObservableObject {
    struct State {
        var restaurant: Restaurant
        var favorites = [Restaurant]()
        var tables: [Table] = []
    }
    
    @Published
    var state: State
    
    private var cancellables = Set<AnyCancellable>()
    
    let userRepository: UserRepository
    let restaurantsRepository: RestaurantsRepository
    
    init(
        userRepository: UserRepository,
        restaurantsRepository: RestaurantsRepository,
        restaurant: Restaurant
    ) {
        self.userRepository = userRepository
        self.restaurantsRepository = restaurantsRepository
        self.state = State(restaurant: restaurant)
        
        loadUserFavoriteRestaurants()
        loadRestaurantTables()
    }
    
    func reload() {
        loadUserFavoriteRestaurants()
        loadRestaurantTables()
    }
    
    func loadRestaurantTables() {
        restaurantsRepository.getTables(restaurantID: state.restaurant.id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let tables):
                    self?.state.tables = tables
                    
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
    
    func heartAction(completion: @escaping () -> Void) {
        let restaurantID = state.restaurant.id
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
    
    func heartImage() -> String {
        state.favorites.contains { $0.id == state.restaurant.id } ? "heart.fill" : "heart"
    }
}

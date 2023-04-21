import Foundation
import SwiftUI
import Combine

class RestaurantSeeAllViewModel: ObservableObject {
    struct State {
        var title = ""
        var restaurants = [Restaurant]()
        var favorites: [Restaurant] = []
    }
    
    @Published
    var state: State = State()

    init(
        title: String,
        restaurants: [Restaurant],
        restaurantsRepository: RestaurantsRepository,
        userRepository: UserRepository
    ) {
        self.restaurantsRepository = restaurantsRepository
        self.userRepository = userRepository
        self.state.title = title
        self.state.restaurants = restaurants
        loadUserFavoriteRestaurants()
    }
    
    let restaurantsRepository: RestaurantsRepository
    let userRepository: UserRepository
    private var cancellables = Set<AnyCancellable>()
    
    func reload() {
        loadUserFavoriteRestaurants()
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

import Foundation
import SwiftUI
import Combine

class ProfileScreenViewModel: ObservableObject {
    struct State {
        var favorites: [Restaurant] = []
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()

    init(
        authRepository: AuthRepository,
        restaurantsRepository: RestaurantsRepository,
        userRepository: UserRepository
    ) {
        self.authRepository = authRepository
        self.restaurantsRepository = restaurantsRepository
        self.userRepository = userRepository
        
        getFavoriteRestaurants()
    }
    
    let authRepository: AuthRepository
    let restaurantsRepository: RestaurantsRepository
    let userRepository: UserRepository
    
    func logOut() {
        authRepository.isSignedIn = false
    }
    
    func getFavoriteRestaurants() {
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
}

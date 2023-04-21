import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    struct State {
        var recommended = [Restaurant]()
        var nearby = [Restaurant]()
        var favorites = [Restaurant]()
        var cuisines = [Category]()
    }
    
    @Published
    var state = State()
    
    let userRepository: UserRepository
    let restaurantsRepository: RestaurantsRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(userRepository: UserRepository, restaurantsRepository: RestaurantsRepository) {
        self.userRepository = userRepository
        self.restaurantsRepository = restaurantsRepository
        loadRecommendedRestaurants()
        loadNearbyRestaurants()
        loadUserFavoriteRestaurants()
        loadCuisines()
    }
    
    func reload() {
        loadUserFavoriteRestaurants()
    }
    
    func loadRecommendedRestaurants() {
        restaurantsRepository.loadAllRestaurants()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let restaurants):
                    self?.state.recommended = restaurants.sorted(by: {$0.rating > $1.rating})
                    
                case .failure(let error):
                    print(#line, #file)
                    print(String(describing: error))
                }
            }
            .store(in: &cancellables)
    }
    
    func loadNearbyRestaurants() {
        restaurantsRepository.loadNearbyRestaurants(
            latitude: userRepository.latitude,
            longitude: userRepository.longitude
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] result in
            switch result {
            case .success(let restaurants):
                self?.state.nearby = restaurants
                
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
    
    func loadCuisines() {
        restaurantsRepository.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let categories):
                    self?.state.cuisines = categories
                    
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
    
    static func stub() -> [Campaign] {
        [
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            )
        ]
    }
}

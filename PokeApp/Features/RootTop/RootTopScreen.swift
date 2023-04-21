import SwiftUI

struct RootTopScreen: View {
    @StateObject
    private var router = Router(initial: Route.signIn, debug: true)
    
    @StateObject
    var viewModel: RootTopViewModel
    
    var body: some View {
        RouterHost(router) { route in
            switch route {
            case .launch:
                LaunchScreen()
                
            case .signIn:
                SignInScreen(
                    viewModel: .init(authRepository: viewModel.environment.authRepository)
                )
                
            case .signUp:
                SignUpScreen(
                    viewModel: .init(authRepository: viewModel.environment.authRepository)
                )
                
            case .success:
                SuccessScreen()
                
            case .home:
                BottomTabView(viewModel: viewModel)
                
            case .reservations:
                ReservationsScreen(
                    viewModel: .init(
                        userRepository: viewModel.environment.userRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository
                    )
                )
                
            case .profile:
                ProfileScreen(
                    viewModel: .init(
                        authRepository: viewModel.environment.authRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
                
            case .allRestaurants:
                AllRestaurantsScreen(
                    viewModel: .init(
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
                
            case .seeAllRestaurants(let title, let restaurants):
                RestaurantSeeAllScreen(
                    viewModel: .init(
                        title: title,
                        restaurants: restaurants,
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
                
            case .restaurantDetails(let restaurant):
                RestaurantDetailsScreen(
                    viewModel: .init(
                        userRepository: viewModel.environment.userRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        restaurant: restaurant
                    )
                )
                
            case .accountsettings:
                AccountSettingsScreen(
                    viewModel: .init(userRepository: viewModel.environment.userRepository)
                )
                
            case .usernamesettings:
                UsernameSettingsScreen(
                    viewModel: .init(userRepository: viewModel.environment.userRepository)
                )
                
            case .feedbackscreen:
                FeedbackScreen()
                
            case .aboutus:
                AboutUsScreen()
                
            case .reserve(let tables):
                ReserveScreen(
                    viewModel: .init(
                        tables: tables,
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
                
            case .reservesuccess:
                ReserveSuccessScreen()
                
            case .seeAllCuisines(let cuisines):
                CuisinesSeeAllScreen(viewModel: .init(cuisines: cuisines))
                
            case .fullnamechange:
                FullNameChangeScreen()
            }
        }
        .onAppear {
            if viewModel.state.isSignedIn {
                router.push(.home)
            }
        }
    }
}

import SwiftUI

struct RootTopScreen: View {
    @StateObject
    private var router = Router(initial: Route.launch, debug: true)
    
    @StateObject
    private var viewModel = RootTopViewModel()
    
    var body: some View {
        RouterHost(router) { route in
            switch route {
            case .launch: LaunchScreen()
            case .signIn: SignInScreen()
            case .signUp: SignUpScreen()
            case .success: SuccessScreen()
            case .home: BottomTabView(viewModel: viewModel)
            case .favorites: FavoritesScreen()
            case .reservations: ReservationsScreen()
            case .profile: ProfileScreen()
            case .allRestaurants: AllRestaurantsScreen()
            case .restaurantDetails: RestaurantDetailsScreen()
            }
        }
    }
}

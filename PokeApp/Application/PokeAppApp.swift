import SwiftUI

@main
struct PokeAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    @StateObject
    private var router = Router(initial: Route.success, debug: true)
    
    // In future can improve it with passing some dependency
    // injector container instead of passing GameState directly
//    @StateObject
//    private var gameState = GameState(debug: true)
    
    var body: some Scene {
        WindowGroup {
            RouterHost(router) { route in
                switch route {
                case .launch: LaunchScreen()
                case .loading: LoadingScreen()
                case .signIn: SignInScreen()
                case .signUp: SignUpScreen()
                case .success: SuccessScreen()
                case .home: HomeScreen()
                case .favorites: FavoritesScreen()
                case .reservations: ReservationsScreen()
                case .profile: ProfileScreen()
                }
            }
//            .environmentObject(gameState)
        }
    }
}

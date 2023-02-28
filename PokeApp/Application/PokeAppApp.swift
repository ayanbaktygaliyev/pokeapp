import SwiftUI

@main
struct PokeAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    // In future can improve it with passing some dependency
    // injector container instead of passing GameState directly
//    @StateObject
//    private var gameState = GameState(debug: true)
    
    var body: some Scene {
        WindowGroup {
            RootTopScreen()
        }
    }
}

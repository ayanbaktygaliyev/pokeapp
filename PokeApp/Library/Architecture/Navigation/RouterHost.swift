import SwiftUI

public struct RouterHost<Route: Equatable, Screen: View>: View {
    @StateObject
    var navigationStyle = NavigationStyle()
        
    let router: Router<Route>
    @ViewBuilder
    let routeMap: (Route) -> Screen
    
    public init(_ router: Router<Route>, @ViewBuilder routeMap: @escaping (Route) -> Screen) {
        self.router = router
        self.routeMap = routeMap
    }

    public var body: some View {
        NavigationControllerHost(
            navTitle: navigationStyle.title,
            navHidden: navigationStyle.isHidden,
            router: router,
            routeMap: routeMap
        )
        .environmentObject(router)
        .environment(\.routerNavigationStyle, navigationStyle)
        .ignoresSafeArea()
    }
}

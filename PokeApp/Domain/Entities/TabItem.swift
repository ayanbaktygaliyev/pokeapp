public enum TabItem: Int, CaseIterable, Hashable {
    case home = 0
    case allRestaurants = 1
    case reservations = 2
    case profile = 3
}

public extension TabItem {
    var title: String {
        switch self {
        case .home:
            return StringConstants.TabView.home
            
        case .allRestaurants:
            return StringConstants.TabView.allRestaurants
            
        case .reservations:
            return StringConstants.TabView.reservations

        case .profile:
            return StringConstants.TabView.profile
        }
    }

    var icon: ImageAsset {
        switch self {
        case .home:
            return .home
            
        case .allRestaurants:
            return .allRestaurants
            
        case .reservations:
            return .reservations

        case .profile:
            return .profile
        }
    }
}

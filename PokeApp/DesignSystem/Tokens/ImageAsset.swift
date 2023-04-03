import Foundation

public enum ImageAsset {    
    case check
    case locationPin
    case currency
    case star
    case error
    
    // Tabs images
    case home
    case allRestaurants
    case reservations
    case profile
    
    // Reservation card
    case person
    case table
    case location
    case clock
    
    var rawValue: String {
        switch self {
        case .check: return "check"
        case .locationPin: return "location-pin"
        case .currency: return "currency"
        case .star: return "star"
        case .home: return "home"
        case .allRestaurants: return "all_restaurants"
        case .reservations: return "reservations"
        case .profile: return "profile"
        case .person: return "person"
        case .table: return "table"
        case .location: return "location"
        case .clock: return "clock"
        case .error: return "error"
        }
    }
}

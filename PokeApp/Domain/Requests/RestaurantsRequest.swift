import Foundation

enum RestaurantsRequest: JSONRequest {
    struct LoginRestaurantIDParemeter: Codable {
        let login: String
        let restaurant_id: String
    }
    
    struct LoginParameter: Codable {
        let login: String
    }
    
    struct ReserveParameter: Codable {
        let table_id: String
        let user_id: String
        let personas: Int
        let reservation_start: String
        let reservation_end: String
    }
    
    struct DeleteReservationParameter: Codable {
        let login: String
        let reservation_id: String
        let table_id: String
    }
    
    case all
    case nearby(latitude: Double, longitude: Double)
    case addFavorite
    case removeFavorite
    case getFavorites
    case getCategories
    case getTables(restaurantID: String)
    case getReservations
    case reserve
    case deleteReservation
    
    var path: String {
        switch self {
        case .all:
            return "/restaurants"
        case .nearby:
            return "/locations"
        case .addFavorite:
            return "/favorite"
        case .removeFavorite:
            return "/delete_favorite"
        case .getFavorites:
            return "/get_favorites"
        case .getCategories:
            return "/categories"
        case .getTables(let restaurantID):
            return "/\(restaurantID)/tables"
        case .getReservations:
            return "/get_reservations"
        case .reserve:
            return "/reserve"
        case .deleteReservation:
            return "/delete_reservation"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .nearby(let latitude, let longitude):
            return [
                .init(name: "longitude", value: "\(longitude)"),
                .init(name: "latitude", value: "\(latitude)")
            ]
            
        default:
            return nil
        }
    }
}

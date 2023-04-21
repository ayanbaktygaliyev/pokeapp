import Foundation
import Combine
import SwiftUI

final class RestaurantsRepository {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func loadAllRestaurants() -> ResultPublisher<[Restaurant]> {
        let request = RestaurantsRequest.all
        return session.load(request: request)
    }
    
    func loadNearbyRestaurants(latitude: Double, longitude: Double) -> ResultPublisher<[Restaurant]> {
        let request = RestaurantsRequest.nearby(latitude: latitude, longitude: longitude)
        return session.load(request: request)
    }
    
    func addFavorite(login: String, restaurantID: String) -> ResultPublisher<AddRemoveFavoriteResponse> {
        let parameter = RestaurantsRequest.LoginRestaurantIDParemeter(login: login, restaurant_id: restaurantID)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.addFavorite
        return session.post(request: request, parameters: parameters)
    }
    
    func removeFavorite(login: String, restaurantID: String) -> ResultPublisher<AddRemoveFavoriteResponse> {
        let parameter = RestaurantsRequest.LoginRestaurantIDParemeter(login: login, restaurant_id: restaurantID)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.removeFavorite
        return session.delete(request: request, parameters: parameters)
    }
    
    func getFavoriteRestaurants(login: String) -> ResultPublisher<[Restaurant]> {
        let parameter = RestaurantsRequest.LoginParameter(login: login)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.getFavorites
        return session.post(request: request, parameters: parameters)
    }
    
    func getCategories() -> ResultPublisher<[Category]> {
        let request = RestaurantsRequest.getCategories
        return session.load(request: request)
    }
    
    func getTables(restaurantID: String) -> ResultPublisher<[Table]> {
        let request = RestaurantsRequest.getTables(restaurantID: restaurantID)
        return session.load(request: request)
    }
    
    func reserve(
        table_id: String,
        user_id: String,
        personas: Int,
        reservation_start: String,
        reservation_end: String
    ) -> ResultPublisher<AddRemoveFavoriteResponse> {
        let parameter = RestaurantsRequest.ReserveParameter(
            table_id: table_id,
            user_id: user_id,
            personas: personas,
            reservation_start: reservation_start,
            reservation_end: reservation_end
        )
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.reserve
        return session.post(request: request, parameters: parameters)
    }
    
    func deleteReservation(
        login: String,
        reservation_id: String,
        table_id: String
    ) -> ResultPublisher<AddRemoveFavoriteResponse> {
        let parameter = RestaurantsRequest.DeleteReservationParameter(
            login: login,
            reservation_id: reservation_id,
            table_id: table_id
        )
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.deleteReservation
        return session.delete(request: request, parameters: parameters)
    }
}

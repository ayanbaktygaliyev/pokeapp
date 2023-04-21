import Foundation

struct ReservationResponse: Codable, Identifiable, Equatable {
    var id: Int? 
    var reservation: Reservation
    var restaurant: Restaurant
}

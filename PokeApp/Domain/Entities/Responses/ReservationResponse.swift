import Foundation

struct ReservationResponse: Codable, Identifiable {
    var id: Int? 
    var reservation: Reservation
    var restaurant: Restaurant
}

extension ReservationResponse {
    static func stub(_ mutate: ((inout Self) -> Void)? = nil) -> Self {
        var value = ReservationResponse(
            id: nil,
            reservation: .stub(),
            restaurant: .stub()
        )
        mutate?(&value)
        return value
    }
}

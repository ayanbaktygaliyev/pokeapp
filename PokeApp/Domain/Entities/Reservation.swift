import Foundation

struct Reservation: Codable, Equatable, Identifiable {
    let id: String
    let personas: Int
    let reservationEnd: String
    let reservationStart: String
    let tableID: String
    let userID: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case personas
        case reservationEnd = "reservation_end"
        case reservationStart = "reservation_start"
        case tableID = "table_id"
        case userID = "user_id"
    }
}

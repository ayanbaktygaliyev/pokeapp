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
    
    static func stub(_ mutate: ((inout Self) -> Void)? = nil) -> Self {
        var value = Reservation(
            id: "634a1120-9f76-485a-ab18-3cfaf3093225",
            personas: 5,
            reservationEnd: "2015-06-03T18:00:00.789",
            reservationStart: "2015-06-03T18:00:00.789",
//                tableID: "a7ea93ca-1514-457b-87a2-3da73a48cade",
            tableID: "7",
            userID: "user1"
        )
        mutate?(&value)
        return value
    }
}

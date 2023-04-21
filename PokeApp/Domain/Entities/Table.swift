import Foundation

struct Table: Equatable, Codable, Identifiable {
    let restaurant_info_id: String
    let seats: Int
    let status: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case restaurant_info_id
        case seats
        case status
        case id
    }
}

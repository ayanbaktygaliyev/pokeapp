import Foundation

struct Restaurant: Equatable, Codable {
    public typealias ID = Identifier<Self, Int>
    
//    public let id: ID?
    public let name: String
//    public let description: String?
//    public let address: String?
//    public let averagePrice: Int?
//    public let rating: Double?
}

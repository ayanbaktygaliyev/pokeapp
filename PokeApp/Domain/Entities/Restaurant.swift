import Foundation

struct Restaurant: Equatable, Codable, Identifiable {
    let address: String
    let categories: [String]
    let contact: String
    let description: String
    var id: String
    let imageURL: URL
    var name: String
    let openingHours: String
    let priceRange: Int
    let rating: Double
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case address
        case categories
        case contact
        case description
        case id
        case imageURL = "image_url"
        case name
        case openingHours = "opening_hours"
        case priceRange = "price_range"
        case rating
        case menu
    }
    
    static func stub(_ mutate: ((inout Self) -> Void)? = nil) -> Self {
        var value = Restaurant(
            address: "Akyrtas street, 1/1",
            categories: ["Ramen", "Japanese"],
            contact: "+7(777)123-45-67",
            description: "Zina restaurant - \"В гостях у Бабушки Зины\"",
            id: "85d436f9-3500-4a4b-abea-840fd5e044ec",
            imageURL: URL(string: "http://1385980-ci11141.tw1.ru:8080/images/zina.jpg")!,
            name: "Zina",
            openingHours: "08:00-24:00",
            priceRange: 4,
            rating: 4.2,
            menu: []
        )
        mutate?(&value)
        return value
    }
}

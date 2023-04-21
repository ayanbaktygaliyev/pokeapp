import Foundation

struct MenuItem: Equatable, Codable, Identifiable {
    let id: String
    let image_url: URL
    let ingredients: String
    let menu_category: String
    let name: String
    let price: Int
}

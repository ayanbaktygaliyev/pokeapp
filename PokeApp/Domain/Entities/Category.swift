import Foundation

struct Category: Equatable, Codable, Identifiable {
    let category: String
    let image_url: URL
    let restaurants: [Restaurant]
    var id: String?
    
    init(category: String, image_url: URL, restaurants: [Restaurant], id: String? = nil) {
        self.category = category
        self.image_url = image_url
        self.restaurants = restaurants
        self.id = category
    }
}


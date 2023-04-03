import Foundation

struct Campaign: Equatable, Decodable, Identifiable {
    let id: UUID
    let title: String
    let subtitle: String
    let description: String?
    let imageURL: URL
    let restaurants: [Restaurant]
}

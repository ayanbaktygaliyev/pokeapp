import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    struct State {
        var favorites = [Restaurant]()
    }
    
    @Published
    var state = State()
    
    static func stub() -> [Campaign] {
        [
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            ),
            Campaign(
                id: UUID(),
                title: "Happy hour campaign!",
                subtitle: "Enjoy meals for 5$",
                description: nil,
                imageURL: URL(string: "https://s3-prod.adage.com/s3fs-public/styles/width_660/public/20220426_HEINZ-Dip-_-Crunch-3x2.jpg")!,
                restaurants: []
            )
        ]
    }
}

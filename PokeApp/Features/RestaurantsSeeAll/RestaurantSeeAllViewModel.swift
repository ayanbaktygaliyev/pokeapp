import Foundation
import SwiftUI

class RestaurantSeeAllViewModel: ObservableObject {
    struct State {
        var title = ""
        var restaurants = [Restaurant]()
    }
    
    @Published
    var state: State = State()

    init(title: String, restaurants: [Restaurant]) {
        self.state.title = title
        self.state.restaurants = restaurants
    }
}

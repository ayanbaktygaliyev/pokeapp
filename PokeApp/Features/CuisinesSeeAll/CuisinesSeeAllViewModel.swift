import Foundation
import SwiftUI
import Combine

class CuisinesSeeAllViewModel: ObservableObject {
    struct State {
        var cuisines: [Category]
    }
    
    @Published
    var state: State

    init(cuisines: [Category]) {
        self.state = State(cuisines: cuisines)
    }
}

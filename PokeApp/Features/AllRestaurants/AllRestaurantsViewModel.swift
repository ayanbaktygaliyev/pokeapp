import Foundation
import SwiftUI

class AllRestaurantsViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    @Published
    var state: State

    init() {
        self.state = State(username: "", password: "")
    }
    
    func didTapSignIn() {
        print("Hello Sign In")
    }
}

import Foundation
import SwiftUI

class ProfileScreenViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    @Published
    var state: State

    init() {
        self.state = State(username: "", password: "")
    }

}

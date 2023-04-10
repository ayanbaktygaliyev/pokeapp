import Foundation
import SwiftUI

class FeedbackScreenViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
        var feedback: String
    }
    
    @Published
    var state: State

    init() {
        self.state = State(username: "", password: "", feedback: "")
    }

}

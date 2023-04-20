import Foundation
import SwiftUI

class AccountSettingsScreenViewModel: ObservableObject {
    struct State {
        var inputs = SignInInputs()
        var username: String
        var password: String
    }
    
    @Published
    var state: State

    init() {
        self.state = State(username: "", password: "")
    }

}
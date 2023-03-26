import Foundation

class ReservationsViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    @Published
    var state: State

    init() {
        self.state = State(username: "", password: "")
    }
    
    func didTapSignUp() {
    }
    
    func didTapSignIn() {
    }
}

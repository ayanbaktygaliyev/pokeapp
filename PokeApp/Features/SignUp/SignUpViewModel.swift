import Foundation

class SignUpViewModel: ObservableObject {
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
        print("Hello Sign Up")
    }
    
    func didTapSignIn() {
        print("Hello Sign in")
    }
}

import Foundation

class SignInViewModel: ObservableObject {
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
    
    func didTapCreateAccount() {
        print("Hello Create account")
    }
}

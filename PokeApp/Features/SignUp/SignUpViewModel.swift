import Foundation
import Combine

class SignUpViewModel: ViewModel, ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    enum Event {
        case signUp
        case signIn
    }
    
    @Published
    var state: State
    
    private var cancellables = [AnyCancellable]()
    
    let authRepository = AuthRepository()

    init() {
        self.state = State(username: "", password: "")
    }
    
    func signUp() {
        authRepository.signUp(
            username: state.username,
            password: state.password
        )
        .receive(on: DispatchQueue.main)
        .sink { result in
            switch result {
            case .success:
                print("Success")
            case .failure(let error):
                print(String(describing: error))
            }
        }
        .store(in: &cancellables)
    }
    
    func signIn() {
        print("Hello Sign in")
    }
}

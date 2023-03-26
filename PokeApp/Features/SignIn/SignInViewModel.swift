import Foundation
import SwiftUI
import Combine

final class SignInViewModel: ViewModel, ObservableObject {
    enum Status: Equatable {
        case idle
        case signingIn
        case signedIn
    }
    
    enum Event {
        case signIn
        case createAccount
    }
    
    struct State {
        var username = ""
        var password = ""
        var status = Status.idle
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    
    let authRepository = AuthRepository()

    init() {}
    
    func signIn() {
        authRepository.signIn(
            username: state.username,
            password: state.password
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] result in
            switch result {
            case .success:
                self?.state.status = .signedIn
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
        .store(in: &cancellables)
    }
}

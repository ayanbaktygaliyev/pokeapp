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
    }
    
    struct State {
        var status = Status.idle
        var inputs = SignInInputs()
        var error: String? = nil
        var isShowingDialog = false
        
        var isSigningIn: Bool {
            guard case .signingIn = status else {
                return false
            }

            return true
        }
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    
    let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func send(event: Event) {
        switch event {
        case .signIn:
            state.inputs.validate()
            
            if case .valid((let username, let password)) = state.inputs.validated {
                signIn(username: username, password: password)
            }
        }
    }
    
    private func signIn(username: String, password: String) {
        state.status = .signingIn
        
        authRepository.signIn(
            username: username,
            password: password
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] result in
            switch result {
            case .success:
                self?.state.status = .signedIn
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set("\(username) bunny", forKey: "fullname")
                self?.authRepository.isSignedIn = true
                
            case .failure(let error):
                self?.state.status = .idle
                self?.state.error = error.errorString
                self?.state.isShowingDialog = true
            }
        }
        .store(in: &cancellables)
    }
}

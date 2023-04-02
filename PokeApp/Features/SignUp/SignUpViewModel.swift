import Foundation
import SwiftUI
import Combine

final class SignUpViewModel: ViewModel, ObservableObject {
    enum Status: Equatable {
        case idle
        case signingUp
        case signedUp
    }
    
    enum Event {
        case signUp
    }
    
    struct State {
        var status = Status.idle
        var inputs = SignUpInputs()
        var error: String? = nil
        var isShowingDialog = false
        
        var isSigningUp: Bool {
            guard case .signingUp = status else {
                return false
            }

            return true
        }
    }
    
    @Published
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    
    let authRepository = AuthRepository()

    init() {}
    
    func send(event: Event) {
        switch event {
        case .signUp:
            state.inputs.validate()
            
            if case .valid((let username, let password)) = state.inputs.validated {
                signUp(username: username, password: password)
            }
        }
    }
    
    private func signUp(username: String, password: String) {
        state.status = .signingUp
        
        authRepository.signUp(
            username: username,
            password: password
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] result in
            switch result {
            case .success:
                self?.state.status = .signedUp
                
            case .failure(let error):
                self?.state.status = .idle
                self?.state.error = error.errorString
                self?.state.isShowingDialog = true
            }
        }
        .store(in: &cancellables)
    }
}

import Foundation
import Combine

protocol AuthRepositoryProtocol {
    func signIn(username: String, password: String) -> ResultPublisher<AuthResponse>
    func signUp(username: String, password: String) -> ResultPublisher<AuthResponse>
}

final class AuthRepository: AuthRepositoryProtocol {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func signIn(username: String, password: String) -> ResultPublisher<AuthResponse> {
        let parameter = AuthRequest.Parameter(login: username, password: password)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = AuthRequest.signIn
        return session.post(request: request, parameters: parameters)
    }

    func signUp(username: String, password: String) -> ResultPublisher<AuthResponse> {
        let parameter = AuthRequest.Parameter(login: username, password: password)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = AuthRequest.signUp
        return session.post(request: request, parameters: parameters)
    }
}

import Foundation
import Combine

protocol AuthRepositoryProtocol {
    func signIn(username: String, password: String)
    func signUp(username: String, password: String)
}

final class AuthRepository: AuthRepositoryProtocol {
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func signIn(username: String, password: String) {
        
    }
    
    func signUp(username: String, password: String) {
        
    }

    public func testLoadTodo(id: Int) -> ResultPublisher<Todo> {
        session.load(request: SignInRequest.todos(id: id))
    }
    
    public func testPostNewPost(param: PostParam) -> ResultPublisher<Post> {
        let parameters = DictionaryHelper.makeDictionary(from: param)
        return session.add(request: SignInRequest.posts, parameters: parameters)
    }
}

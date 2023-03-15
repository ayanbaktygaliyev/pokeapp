import Foundation
import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    @Published
    var state: State
    
    private var cancellables = [AnyCancellable]()
    
    let authRepository = AuthRepository()

    init() {
        self.state = State(username: "", password: "")
    }
    
//    func isFieldEmpty() -> Bool {
//        if State(username: "", password: "") == true {
//                print("Empty")
//            }
//        return true
//    }
    
    func didTapSignIn() {
        print("Hello Sign In")
        let param = PostParam(title: "Hi", body: "ily", userId: 1)
        
        authRepository.testPostNewPost(param: param)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .success(let post):
                    print("// post: \(post)")
                case .failure(let error):
                    print("// error: \(error)")
                }
            }
            .store(in: &cancellables)
        
//        authRepository.testLoadTodo(id: 1)
//            .receive(on: DispatchQueue.main)
//            .sink { result in
//                switch result {
//                case .success(let todo):
//                    print("// todo: \(todo)")
//                case .failure(let error):
//                    print("// error: \(error)")
//                }
//            }
//            .store(in: &cancellables)
    }
}

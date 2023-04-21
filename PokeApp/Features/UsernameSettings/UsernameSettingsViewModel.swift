import Foundation
import SwiftUI

class UsernameSettingsScreenViewModel: ObservableObject {
    struct State {
        var username = ""
        var confirmUsername = ""
        var isShowingDialog = false
    }
    
    @Published
    var state = State()
    
    private let userRepository = UserRepository()

    func changeUsername(completion: @escaping() -> Void) {
        if state.username != state.confirmUsername {
            state.isShowingDialog = true
            return
        }
        
        userRepository.changeUsername(username: state.username)
        completion()
    }
}

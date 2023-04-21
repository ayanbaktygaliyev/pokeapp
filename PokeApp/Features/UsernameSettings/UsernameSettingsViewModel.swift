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
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func changeUsername(completion: @escaping() -> Void) {
        if state.username != state.confirmUsername {
            state.isShowingDialog = true
            return
        }
        
        userRepository.changeUsername(username: state.username)
        completion()
    }
}

import Foundation
import SwiftUI

class FullNameChangeScreenViewModel: ObservableObject {
    struct State {
        var fullname = ""
        var confirmFullname = ""
        var isShowingDialog = false
    }
    
    @Published
    var state = State()
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func changeFullname(completion: @escaping() -> Void) {
        if state.fullname != state.confirmFullname {
            state.isShowingDialog = true
            return
        }
        
        userRepository.changeFullname(fullname: state.fullname)
        completion()
    }
}

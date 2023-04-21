import Foundation
import SwiftUI
import Combine

class AccountSettingsScreenViewModel: ObservableObject {
    struct State {
        var username: String
        var fullname: String
        var phoneNumber: String = ""
        var password = "bunnytest1"
    }
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
        state = State(username: userRepository.username, fullname: userRepository.fullname)
    }
    
    let userRepository: UserRepository
    
    @Published
    var state: State
    
    func reload() {
        state.username = userRepository.username
        state.fullname = userRepository.fullname
    }
}

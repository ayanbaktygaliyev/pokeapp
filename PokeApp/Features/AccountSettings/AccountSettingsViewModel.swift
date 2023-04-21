import Foundation
import SwiftUI
import Combine

class AccountSettingsScreenViewModel: ObservableObject {
    struct State {
        var username: String
        var fullname: String = ""
        var phoneNumber: String = ""
        var password = "bunnytest1"
    }
    
    init() {
        state = State(username: userRepository.username)
    }
    
    private var userRepository = UserRepository()
    
    @Published
    var state: State
    
    func reload() {
        state.username = userRepository.username
    }
}

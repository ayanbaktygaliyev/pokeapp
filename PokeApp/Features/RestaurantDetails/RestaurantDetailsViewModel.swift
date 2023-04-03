import Foundation
import SwiftUI
import Combine

final class RestaurantDetailsViewModel: ViewModel, ObservableObject {
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
    
    let authRepository = AuthRepository()

    init() {}
    
    func send(event: Event) {
        
    }
}

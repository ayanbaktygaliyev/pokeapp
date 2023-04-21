import Foundation
import SwiftUI

class RootTopViewModel: ObservableObject {
    struct State {
        var tab = TabItem.home
        var isSignedIn: Bool
        
        public func binding<T>(
            _ keyPath: KeyPath<State, T>,
            setAnimation: Animation? = nil,
            event: @escaping (T) -> (Void)
        ) -> Binding<T> {
            Binding(
                get: { self[keyPath: keyPath] },
                set: { value in
                    withAnimation(setAnimation) {
                        event(value)
                    }
                }
            )
        }
    }
    
    @Published
    var state: State
    
    private let authRepository = AuthRepository()
    
    init() {
        self.state = State(isSignedIn: authRepository.isSignedIn)
    }
    
    func switchTab(_ tab: TabItem) {
        state.tab = tab
    }
}

import Foundation
import SwiftUI

class RootTopViewModel: ObservableObject {
    struct State {
        var tab = TabItem.home
        
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
    
    init() {
        self.state = State()
    }
    
    func switchTab(_ tab: TabItem) {
        state.tab = tab
    }
}

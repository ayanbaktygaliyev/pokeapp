import Foundation
import SwiftUI
import Combine

final class ReserveViewModel: ViewModel, ObservableObject {
    enum Event {
        case selectTable(id: Int)
        case changeNumberOfPeople(Int)
    }
    
    struct State {
        var selectedTableID: Int = 0
        var date = Date()
        var hours = Date()
        var numberOfPeople = 0
        
        
        func isTableSelected(tableID: Int) -> Bool {
            selectedTableID == tableID
        }
        
        func binding<T>(
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
    var state = State()
    
    private var cancellables = Set<AnyCancellable>()
    
    let authRepository = AuthRepository()

    init() {}
    
    func send(event: Event) {
        switch event {
        case .selectTable(let id):
            state.selectedTableID = id
        case .changeNumberOfPeople(let numberOfPeople):
            guard numberOfPeople >= 0 else {
                return
            }
            state.numberOfPeople = numberOfPeople
        }
    }
}

import Foundation
import SwiftUI
import Combine

final class ReserveViewModel: ViewModel, ObservableObject {
    enum Event {
        case selectTable(id: String)
    }
    
    struct State {
        var tables: [Table]
        var selectedTableID: String = ""
        var date = Date()
        var hours = Date()
        var numberOfPeople = 0
        var isShowingDialog = false
        
        func isTableSelected(tableID: String) -> Bool {
            selectedTableID == tableID
        }
    }
    
    @Published
    var state: State
    
    let restaurantsRepository: RestaurantsRepository
    let userRepository: UserRepository
    
    private var cancellables = Set<AnyCancellable>()

    init(tables: [Table], restaurantsRepository: RestaurantsRepository, userRepository: UserRepository) {
        self.state = State(tables: tables)
        self.restaurantsRepository = restaurantsRepository
        self.userRepository = userRepository
    }
    
    func send(event: Event) {
        switch event {
        case .selectTable(let id):
            state.selectedTableID = id
        }
    }
    
    func reserve(completion: @escaping () -> Void) {
        guard let table = state.tables.first(where: { $0.id == state.selectedTableID }) else {
            return
        }
        
        guard table.seats >= state.numberOfPeople else {
            state.isShowingDialog = true
            return
        }
        
        restaurantsRepository.reserve(
            table_id: state.selectedTableID,
            user_id: userRepository.username,
            personas: state.numberOfPeople,
            reservation_start: Dates.parseString(date: state.date),
            reservation_end: Dates.parseString(date: state.date)
        )
        .receive(on: DispatchQueue.main)
        .sink { result in
            switch result {
            case .success:
                completion()
            case .failure(let error):
                print(#line, #file)
                print(String(describing: error))
            }
        }
        .store(in: &cancellables)
    }
}

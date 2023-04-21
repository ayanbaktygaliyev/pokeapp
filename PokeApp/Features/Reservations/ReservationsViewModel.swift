import Foundation
import Combine

class ReservationsViewModel: ObservableObject {
    struct State {
        var reservations: [ReservationResponse] = []
    }
    
    @Published
    var state = State()
    
    let userRepository: UserRepository
    let restaurantsRepository: RestaurantsRepository
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userRepository: UserRepository, restaurantsRepository: RestaurantsRepository) {
        self.userRepository = userRepository
        self.restaurantsRepository = restaurantsRepository
        loadReservations()
    }
    
    func deleteReservations(reservationResponse: ReservationResponse) {
        restaurantsRepository.deleteReservation(
            login: userRepository.username,
            reservation_id: reservationResponse.reservation.id,
            table_id: reservationResponse.reservation.tableID
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] result in
            switch result {
            case .success:
                self?.state.reservations.removeAll { $0 == reservationResponse }
            case .failure(let error):
                print(#line, #file)
                print(String(describing: error))
            }
        }
        .store(in: &cancellables)
        
    }
    
    func loadReservations() {
        userRepository.getUserReservations()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let reservations):
                    self?.state.reservations = reservations
                case .failure(let error):
                    print(#line, #file)
                    print(String(describing: error))
                }
            }
            .store(in: &cancellables)
    }
}

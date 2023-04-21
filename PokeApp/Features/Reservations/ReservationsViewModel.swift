import Foundation

class ReservationsViewModel: ObservableObject {
    struct State {
        var reservations: [ReservationResponse] = [
            .stub {
                $0.id = 1
                $0.restaurant = .stub {
                    $0.name = "Тәтті"
                    $0.id = "1"
                }
            },
            .stub {
                $0.id = 2
                $0.restaurant = .stub {
                    $0.name = "Qazy Qarta"
                    $0.id = "2"
                }
            },
            .stub {
                $0.id = 3
                $0.restaurant = .stub {
                    $0.name = "Seoul Food"
                    $0.id = "3"
                }
            },
            .stub()
        ]
    }
    
    @Published
    var state = State()
    
    func deleteReservations(indexSet: IndexSet) {
        state.reservations.remove(atOffsets: indexSet)
    }
}

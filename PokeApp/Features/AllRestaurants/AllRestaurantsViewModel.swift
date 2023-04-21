import Foundation
import SwiftUI

class AllRestaurantsViewModel: ObservableObject {
    struct State {
        private var restaurants: [Restaurant] = [
            .stub {
                $0.name = "Тәтті"
                $0.id = "1"
            },
            .stub {
                $0.name = "Qazy Qarta"
                $0.id = "2"
            },
            .stub {
                $0.name = "Seoul Food"
                $0.id = "3"
            },
            .stub()
        ]
        
        var searchText: String = ""
        var filteredRestaurants: [Restaurant] {
            if searchText.isEmpty {
                return restaurants
            }
            
            return restaurants.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    @Published
    var state = State()
}

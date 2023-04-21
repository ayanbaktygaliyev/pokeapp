import SwiftUI

struct BottomTabView: View {
    @ObservedObject
    private var viewModel: RootTopViewModel
    
    init(viewModel: RootTopViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationBottom(
            viewModel.state.binding(\.tab, event: {
                viewModel.switchTab($0)
            }),
            title: \.title,
            icon: \.icon,
            tabs: TabItem.allCases,
            content: { tab in
                tabPage(tab)
            }
        )
    }
}

private extension BottomTabView {
    func tabPage(_ tab: TabItem) -> some View {
        NavigationView {
            switch tab {
            case .home:
                HomeScreen(
                    viewModel: .init(
                        userRepository: viewModel.environment.userRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository
                    )
                )
                
            case .allRestaurants:
                AllRestaurantsScreen(
                    viewModel: .init(
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
                
            case .reservations:
                ReservationsScreen(
                    viewModel: .init(
                        userRepository: viewModel.environment.userRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository
                    )
                )
                
            case .profile:
                ProfileScreen(
                    viewModel: .init(
                        authRepository: viewModel.environment.authRepository,
                        restaurantsRepository: viewModel.environment.restaurantsRepository,
                        userRepository: viewModel.environment.userRepository
                    )
                )
            }
        }
    }
}

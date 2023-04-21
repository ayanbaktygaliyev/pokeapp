import SwiftUI

public struct AllRestaurantsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: AllRestaurantsViewModel
    
    public var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            headerView
                .padding(.horizontal, 16)

            if viewModel.state.restaurants.isEmpty {
                VStack {
                    FoodieEmptyPlaceholder(title: StringConstants.RestaurantSeeAll.empty)
                    
                    Spacer()
                }
            }
            else {
                restaurantsSection
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            HStack {
                Image(asset: .locationPin)
                    .resizable()
                    .frame(width: 20, height: 27)
                
                TextLabel(
                    content: StringConstants.App.yourLocation,
                    color: .foodieGreen,
                    fontToken: .size16,
                    style: .semibold
                )
            }
            
            Spacer()
            
            Logo(fontToken: .size20)
        }
    }
    
    
    private var restaurantsSection: some View {
        NavigationStack {
            List {
                ForEach(viewModel.state.filteredRestaurants) { restaurant in
                    RestaurantCard(
                        restaurant: restaurant,
                        heartAction: {
                            viewModel.heartAction(restaurantID: restaurant.id) {
                                viewModel.reload()
                            }
                        },
                        heartImage: viewModel.heartImage(restaurantID: restaurant.id)
                    )
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        router.push(.restaurantDetails(restaurant: restaurant))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Restaurants"))
            .navigationBarTitleDisplayMode(.large)
            .refreshable {
                viewModel.loadAllRestaurants()
            }
        }
        .searchable(text: $viewModel.state.searchText)
    }
}

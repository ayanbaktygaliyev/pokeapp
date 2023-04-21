import SwiftUI

public struct AllRestaurantsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = AllRestaurantsViewModel()
    
    public var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            headerView
                .padding(.horizontal, 16)

            restaurantsSection
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
                    RestaurantCard(restaurant: restaurant)
                        .listRowSeparator(.hidden)
                        .button {
                            router.push(.restaurantDetails)
                        }
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Restaurants"))
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $viewModel.state.searchText)
    }
}

struct AllRestaurantsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllRestaurantsScreen()
    }
}

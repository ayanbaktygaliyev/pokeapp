import SwiftUI

public struct AllRestaurantsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = AllRestaurantsViewModel()
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            
            headerView
                .padding(.trailing, 16)
 
//            TextLabel(
//                content: StringConstants.AllRestaurants.restaurants,
//                color: .black,
//                fontToken: .size24,
//                style: .bold
//            )

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
            List{
                ForEach(0..<10) { index in
                    RestaurantCard.stub()
                }
            }
            .listStyle(.plain)
            .padding(.leading, -15)
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

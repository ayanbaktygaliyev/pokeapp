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
            
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing16) {

                    TextLabel(
                        content: StringConstants.AllRestaurants.restaurants,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    cuisinesSection
                    
                    restaurantsSection
                }
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
    
    private var cuisinesSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.AllRestaurants.cuisines,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.App.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .padding(.trailing, 16)
                .button {
                    print("See all")
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        HomeCuisineCard.stub()
                            .frame(width: 140, height: 200)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                    }
                }
            }
        }
    }
    
    private var restaurantsSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.Home.recommended,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.App.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .padding(.trailing, 16)
                .button {
                    print("See all")
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        RestaurantCard.stub()
                    }
                }
            }
            .padding(.trailing, 16)
        }
    }
}

struct AllRestaurantsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllRestaurantsScreen()
    }
}

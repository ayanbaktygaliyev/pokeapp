import SwiftUI

public struct RestaurantSeeAllScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = RestaurantSeeAllViewModel()
    
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
                        content: StringConstants.RestaurantSeeAll.recommended,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    Spacer()
                        .fixedSize()
                    
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
    
    private var restaurantsSection: some View {
        VStack(spacing: .spacing6) {
            
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

struct RestaurantSeeAllScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSeeAllScreen()
    }
}

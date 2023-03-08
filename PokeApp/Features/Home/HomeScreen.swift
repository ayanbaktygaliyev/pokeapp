import SwiftUI

public struct HomeScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            
            headerView
            
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing16) {

                    TextLabel(
                        content: StringConstants.Home.restaurants,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    salesSection
                    
                    recommendedSection
                    
                    cuisinesSection
                    
                    nearbySection
                    
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
                    content: StringConstants.Home.yourLocation,
                    color: .foodieGreen,
                    fontToken: .size16,
                    style: .semibold
                )
            }
            
            Spacer()
            
            Logo(fontToken: .size20)
        }
    }
    
    private var salesSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: .spacing12) {
                        ForEach(0..<10) { index in
                            HomeSalesCard.stub()
                                .frame(width: 343, height: 164)
                                .padding(.trailing, index == 10 - 1 ? 16 : 0)
                        }
                    }
                }
            }
        }
    }
    
    private var recommendedSection: some View {
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
                    content: StringConstants.Home.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .button {
                    print("See all")
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        HomeRecommendedCard.stub()
                            .frame(width: 166, height: 220)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                    }
                }
            }
        }
    }
    
    private var cuisinesSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.Home.cuisines,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.Home.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
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
    
    private var nearbySection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.Home.nearby,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.Home.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .button {
                    print("See all")
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        HomeRecommendedCard.stub()
                            .frame(width: 166, height: 220)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

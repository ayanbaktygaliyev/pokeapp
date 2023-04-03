import SwiftUI

public struct HomeScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    @State
    private var currentIndex = 0
    
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
                        content: StringConstants.Home.restaurants,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    temporaryCampaignSection
                    
//                    campaignsSection
                    
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
    
    private var temporaryCampaignSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .spacing12) {
                ForEach(0..<5) { index in
                    ZStack(alignment: .bottom) {
                        HomeCampaignCard.stub()
                        
                        HStack(spacing: .spacing10) {
                            ForEach(0..<5) { index in
                                Circle()
                                    .fill(Color(.foodieGreen))
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.trailing, index == 5 - 1 ? 16 : 0)
                }
            }
        }
    }
    
    private var campaignsSection: some View {
        SnapCarousel(index: $currentIndex, items: HomeViewModel.stub()) { campaign in
            HomeCampaignCard(campaign: campaign)
                .frame(width: 343, height: 164)
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
                    content: StringConstants.App.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .padding(.trailing, 16)
                .button {
                    router.push(.seeallRestaurants)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        HomeRecommendedCard.stub()
                            .frame(width: 166, height: 220)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                            .button {
                                router.push(.restaurantDetails)
                            }
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
                            .button {
                                router.push(.restaurantDetails)
                            }
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
                        HomeRecommendedCard.stub()
                            .frame(width: 166, height: 220)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                            .button {
                                router.push(.restaurantDetails)
                            }
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

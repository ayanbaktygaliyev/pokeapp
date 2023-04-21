import SwiftUI

public struct HomeScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    var viewModel: HomeViewModel
    
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
                    
                    recommendedSection
                    
                    cuisinesSection
                    
                    nearbySection
                    
                    favouritesSection
                        .opacity(viewModel.state.favorites.count == 0 ? 0 : 1)
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
                    router.push(
                        .seeAllRestaurants(title: "Recommended", restaurants: viewModel.state.recommended)
                    )
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(viewModel.state.recommended) { restaurant in
                        HomeRecommendedCard(
                            restaurant: restaurant,
                            heartAction: {
                                viewModel.heartAction(restaurantID: restaurant.id) {
                                    viewModel.reload()
                                }
                            },
                            heartImage: viewModel.heartImage(restaurantID: restaurant.id)
                        )
                        .frame(width: 166, height: 220)
                        .padding(.trailing, viewModel.state.recommended.last == restaurant ? 16 : 0)
                        .button {
                            router.push(
                                .restaurantDetails(restaurant: restaurant)
                            )
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
                    router.push(.seeAllCuisines(cuisines: viewModel.state.cuisines))
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(viewModel.state.cuisines, id: \.category) { cuisine in
                        HomeCuisineCard(cuisine: cuisine)
                            .frame(width: 140, height: 200)
                            .padding(.trailing, viewModel.state.cuisines.last == cuisine ? 16 : 0)
                            .onTapGesture {
                                router.push(
                                    .seeAllRestaurants(
                                        title: cuisine.category,
                                        restaurants: cuisine.restaurants
                                    )
                                )
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
                    router.push(
                        .seeAllRestaurants(title: "Nearby", restaurants: viewModel.state.nearby)
                    )
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(viewModel.state.nearby) { restaurant in
                        HomeRecommendedCard(
                            restaurant: restaurant,
                            heartAction: {
                                viewModel.heartAction(restaurantID: restaurant.id) {
                                    viewModel.reload()
                                }
                            },
                            heartImage: viewModel.heartImage(restaurantID: restaurant.id)
                        )
                        .frame(width: 166, height: 220)
                        .padding(.trailing, viewModel.state.recommended.last == restaurant ? 16 : 0)
                        .button {
                            router.push(
                                .restaurantDetails(restaurant: restaurant)
                            )
                        }
                    }
                }
            }
        }
    }
    
    private var favouritesSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.Home.favourites,
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
                    router.push(
                        .seeAllRestaurants(title: "Favourites", restaurants: viewModel.state.favorites)
                    )
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(viewModel.state.favorites) { restaurant in
                        HomeRecommendedCard(
                            restaurant: restaurant,
                            heartAction: {
                                viewModel.heartAction(restaurantID: restaurant.id) {
                                    viewModel.reload()
                                }
                            },
                            heartImage: viewModel.heartImage(restaurantID: restaurant.id)
                        )
                        .frame(width: 166, height: 220)
                        .padding(.trailing, viewModel.state.recommended.last == restaurant ? 16 : 0)
                        .button {
                            router.push(
                                .restaurantDetails(restaurant: restaurant)
                            )
                        }
                    }
                }
            }
        }
    }
    
}

import SwiftUI

public struct RestaurantDetailsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: RestaurantDetailsViewModel
    
    public var body: some View {
        content
            .ignoresSafeArea()
    }
}

private extension RestaurantDetailsScreen {
    private var content: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical) {
                VStack(spacing: .spacing16) {
                    ZStack(alignment: .topLeading) {
                        CachedAsyncImage(
                            url: viewModel.state.restaurant.imageURL,
                            content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: 300)
                            },
                            placeholder: {
                                FoodiePlaceholderImage()
                                    .frame(width: UIScreen.main.bounds.width, height: 300)
                            }
                        )
                        
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.2))
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: "chevron.left")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 8, height: 12)
                        }
                        .padding(.leading, 16)
                        .padding(.top, 64)
                        .button {
                            router.pop()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: .spacing12) {
                        HStack {
                            TextLabel(
                                content: viewModel.state.restaurant.name,
                                color: .black,
                                fontToken: .size24,
                                style: .semibold
                            )
                            
                            Spacer()
                            
                            Image(systemName: viewModel.heartImage())
                                .resizable()
                                .frame(width: 20, height: 18)
                                .foregroundColor(Color(.foodieGreen))
                                .button {
                                    viewModel.heartAction {
                                        viewModel.reload()
                                    }
                                }
                        }
                        
                        TextLabel(
                            content: viewModel.state.restaurant.description,
                            color: .black,
                            fontToken: .size15,
                            style: .regular
                        )
                        .lineLimit(5)
                        
                        generalInfoView
                        
                        if !viewModel.state.restaurant.menu.isEmpty {
                            menu
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            
            Button(title: "Reserve") {
                router.push(.reserve(tables: viewModel.state.tables))
            }
            .padding(.bottom, 32)
        }
    }
    
    private var generalInfoView: some View {
        VStack(alignment: .leading, spacing: .spacing12) {
            HStack(spacing: .spacing8) {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                TextLabel(
                    content: String(format: "%.1f", viewModel.state.restaurant.rating),
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
            }
            
            HStack(spacing: .spacing8) {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                TextLabel(
                    content: "\(viewModel.state.restaurant.openingHours)",
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
            }
            
            HStack(spacing: .spacing8) {
                Image(systemName: "location.circle")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                TextLabel(
                    content: "1.4 km",
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
            }
            
            HStack(spacing: .spacing8) {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                TextLabel(
                    content: "Price range of \(viewModel.state.restaurant.priceRange)",
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
            }
        }
    }
    
    private var menu: some View {
        VStack(alignment: .leading, spacing: .spacing12) {
            TextLabel(
                content: "Menu",
                color: .black,
                fontToken: .size16,
                style: .medium
            )
            
            ForEach(viewModel.state.restaurant.menu) { menuItem in
                menuItemCard(menuItem: menuItem)
            }
            
            Spacer(minLength: 90)
                .fixedSize()
        }
    }
    
    private func menuItemCard(
        menuItem: MenuItem
    ) -> some View {
        HStack(spacing: .spacing12) {
            VStack(alignment: .leading, spacing: .spacing4) {
                TextLabel(
                    content: menuItem.name,
                    color: .black,
                    fontToken: .size13,
                    style: .medium
                )
                
                TextLabel(
                    content: menuItem.ingredients,
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
                
                TextLabel(
                    content: "\(menuItem.price) KZT",
                    color: .foodieGreen,
                    fontToken: .size12,
                    style: .regular
                )
            }
            
            Spacer()
            
            CachedAsyncImage(
                url: menuItem.image_url,
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 70)
                        .cornerRadius(12)
                },
                placeholder: {
                    FoodiePlaceholderImage()
                        .frame(width: 110, height: 70)
                        .cornerRadius(12)
                }
            )
        }
    }
}

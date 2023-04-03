import SwiftUI

public struct RestaurantDetailsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = RestaurantDetailsViewModel()
    
    public var body: some View {
        content
            .ignoresSafeArea()
    }
}

private extension RestaurantDetailsScreen {
    private var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: .spacing16) {
                ZStack(alignment: .topLeading) {
                    Image("test")
                        .resizable()
                        .frame(height: 300)
                    
                    ZStack {
                        Circle()
                            .fill(.black.opacity(0.48))
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
                            content: "Test name",
                            color: .black,
                            fontToken: .size24,
                            style: .semibold
                        )
                        
                        Spacer()
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 18)
                            .foregroundColor(Color(.foodieGreen))
                    }
                    
                    TextLabel(
                        content: "Test description description description description",
                        color: .black,
                        fontToken: .size15,
                        style: .regular
                    )
                    
                    generalInfoView
                    
                    menu
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    private var generalInfoView: some View {
        VStack(alignment: .leading, spacing: .spacing12) {
            HStack(spacing: .spacing8) {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                TextLabel(
                    content: "4.8",
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
                    content: "11:00 - 23:00",
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
                    content: "7000 KZT",
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
            
            ForEach(0..<20) { index in
                menuItem()
            }
        }
    }
    
    private func menuItem(
        image: String = "korean",
        title: String = "Menu item",
        ingredients: [String] = ["dunno", "dunno", "dunno just", "dunno just", "dunno just"],
        price: Int = 2500
    ) -> some View {
        HStack(spacing: .spacing12) {
            VStack(alignment: .leading, spacing: .spacing4) {
                TextLabel(
                    content: title,
                    color: .black,
                    fontToken: .size13,
                    style: .medium
                )
                
                TextLabel(
                    content: ingredients.joined(separator: ","),
                    color: .black,
                    fontToken: .size12,
                    style: .regular
                )
                
                TextLabel(
                    content: "\(price) KZT",
                    color: .foodieGreen,
                    fontToken: .size12,
                    style: .regular
                )
            }
            
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 70)
                .cornerRadius(12)
        }
    }
}

struct RestaurantDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsScreen()
    }
}

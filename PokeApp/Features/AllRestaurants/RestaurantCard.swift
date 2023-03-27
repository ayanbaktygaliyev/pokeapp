import SwiftUI

struct RestaurantCard: View {
    let imageName: String
    let restaurantName: String
    let categories: [String]
    let price: Int
    let rating: Double
    
    var body: some View {
        content
            .cornerRadius(15)
            .background(
                Color(.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
            )
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                
                likeButton
            }
            
            Spacer(minLength: 7)
                .fixedSize()
            
            TextLabel(
                content: restaurantName,
                color: .black,
                fontToken: .size13,
                style: .semibold
            )
            .padding(.leading, 12)
            
            Spacer(minLength: 3)
                .fixedSize()
            
            TextLabel(
                content: categories.joined(separator: ", "),
                color: .black,
                fontToken: .size12,
                style: .regular
            )
            .padding(.leading, 12)
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundColor(Color(.dashLine))
                .frame(height: 0.5)
            
            Spacer(minLength: 12)
                .fixedSize()
            
            priceAndRatingView
                .padding(.horizontal, 12)
            
            Spacer(minLength: 8)
                .fixedSize()
        }
    }
    
    private var priceAndRatingView: some View {
        HStack() {
            priceView
            
            Spacer()
            
            Circle()
                .fill(Color(.dot))
                .frame(width: 2, height: 2)
            
            Spacer()
            
            ratingView
        }
    }
    
    private var priceView: some View {
        HStack(spacing: .spacing4) {
            ForEach(0..<4) { _ in
                Image(asset: .currency)
                    .resizable()
                    .frame(width: 7, height: 13.5)
            }
        }
    }
    
    private var ratingView: some View {
        HStack(spacing: .spacing2) {
            ForEach(0..<5) { _ in
                Image(asset: .star)
                    .resizable()
                    .frame(width: 12.5, height: 12)
            }
        }
    }
    
    private var likeButton: some View {
        ZStack {
            Circle()
                .fill(.black.opacity(0.48))
                .frame(width: 32, height: 32)
                .padding(.trailing, 8)
                .padding(.top, 8)
            
            Image(asset: .system(.favorites))
                .resizable()
                .foregroundColor(Color(.foodieGreen))
                .frame(width: 20, height: 18)
                .padding(.trailing, 8)
                .padding(.top, 10)
                .button {
                    print("Liked")
                }
        }
    }
}

extension RestaurantCard {
    static func stub() -> Self {
        RestaurantCard(
            imageName: "test",
            restaurantName: "Seoul Food",
            categories: ["healthy", "korean"],
            price: 2,
            rating: 5
        )
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard.stub()
    }
}

import SwiftUI

struct HomeCuisineCard: View {
    let cuisine: Category
    
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
            CachedAsyncImage(
                url: cuisine.image_url,
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                },
                placeholder: {
                    FoodiePlaceholderImage()
                        .frame(width: 140, height: 140)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                }
            )
            
            Spacer(minLength: 7)
                .fixedSize()
            
            TextLabel(
                content: cuisine.category,
                color: .black,
                fontToken: .size13,
                style: .semibold
            )
            .padding(.leading, 12)
            
            TextLabel(
                content: "\(cuisine.restaurants.count) \(StringConstants.Home.places)",
                color: .foodieGreen,
                fontToken: .size10,
                style: .semibold
            )
            .padding(.leading, 12)
            
            Spacer(minLength: 10)
                .fixedSize()
        }
    }
}

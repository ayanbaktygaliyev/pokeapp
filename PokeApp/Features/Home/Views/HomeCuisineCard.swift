import SwiftUI

struct HomeCuisineCard: View {
    let imageName: String
    let cuisineName: String
    let places: Int
    
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
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(15, corners: [.topLeft, .topRight])
            
            Spacer(minLength: 7)
                .fixedSize()
            
            TextLabel(
                content: cuisineName,
                color: .black,
                fontToken: .size13,
                style: .semibold
            )
            .padding(.leading, 12)
            
            TextLabel(
                content: "\(places) \(StringConstants.Home.places)",
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

extension HomeCuisineCard {
    static func stub() -> Self {
        HomeCuisineCard(
            imageName: "korean",
            cuisineName: "Korean",
            places: 77
        )
    }
}

struct HomeCuisineCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCuisineCard.stub()
    }
}

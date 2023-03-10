import SwiftUI

struct HomeSalesCard: View {
    
    let imageName: String
    
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
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(15, corners: [.topLeft, .topRight])
    }
}

extension HomeSalesCard {
    static func stub() -> Self {
        HomeSalesCard(
            imageName: "sales"
        )
    }
}

struct HomeSalesCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeSalesCard.stub()
    }
}

import SwiftUI

struct FoodieEmptyPlaceholder: View {
    let title: String
    
    var body: some View {
        VStack(spacing: .spacing24) {
            Spacer(minLength: 20)
                .fixedSize()
            
            Image(asset: .empty)
                .resizable()
                .frame(width: 360, height: 400)
                .scaledToFill()
            
            
            TextLabel(
                content: title,
                color: .black,
                fontToken: .size16,
                style: .semibold
            )
            .multilineTextAlignment(.center)
        }
    }
}

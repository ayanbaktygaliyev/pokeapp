import SwiftUI

public struct Dialog: View {
    public var isShowingDialog: Binding<Bool>
    public let title: String
    public let subtitle: String
    public let colorToken: ColorToken
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: .spacing20) {
                Spacer(minLength: 16)
                    .fixedSize()
                
                Image(asset: .error)
                    .resizable()
                    .frame(width: 128, height: 128)
                    .scaledToFit()
                
                TextLabel(
                    content: title,
                    color: .black,
                    fontToken: .size20,
                    style: .semibold
                )
                
                TextLabel(
                    content: subtitle,
                    color: .black,
                    fontToken: .size15,
                    style: .medium
                )
                .multilineTextAlignment(.center)
                
                Spacer(minLength: 12)
                    .fixedSize()
                
                Button(title: StringConstants.App.close, color: colorToken) {
                    isShowingDialog.wrappedValue = false
                }
                
                Spacer(minLength: 32)
                    .fixedSize()
            }
            .frame(height: 400)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 16)
            .padding(.horizontal, 16)
        }
    }
}

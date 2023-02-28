import SwiftUI

public struct LoadingScreen: View {
    public var body: some View {
        VStack{
            
            Spacer(minLength: 150)
                .fixedSize()
            
            TextLabel(
                content: StringConstants.App.foodie,
                color: .foodieGreen,
                fontToken: .size70,
                style: .bold
            )
            
            Spacer(minLength: 58)
                .fixedSize()
            
            GifImage("loading")
                .allowsHitTesting(false)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}

import SwiftUI

public struct LoadingScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    public var body: some View {
        VStack {
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
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    router.push(.signIn)
                }
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}

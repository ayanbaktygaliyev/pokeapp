import SwiftUI

public struct LaunchScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    public var body: some View {
        ZStack {
            Color(.foodieGreen)
                .ignoresSafeArea()
            
            VStack {
                TextLabel(
                    content: StringConstants.App.foodie,
                    color: .white,
                    fontToken: .size70,
                    style: .bold
                )
                
                TextLabel(
                    content: StringConstants.App.slogan,
                    color: .white,
                    fontToken: .size22,
                    style: .bold
                )
            }
            .padding(.bottom, 200)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    router.push(.loading)
                }
            }
        }
    }
}

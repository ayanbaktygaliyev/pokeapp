import SwiftUI

public struct SuccessScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    public var body: some View {
        VStack{
            Spacer(minLength: 203)
                .fixedSize()
            
            ZStack {
                Circle()
                    .fill(Color(.successBackground))
                    .frame(width: 92, height: 92)
                    .shadow(color: Color(.successBackground), radius: 1, x: 0, y: 10)
                    .blur(radius: 70)
                
                Circle()
                    .fill(Color(.foodieGreen))
                    .frame(width: 92, height: 92)
                Image(asset: .check)
            }
            Spacer(minLength: 29)
                .fixedSize()
            
            TextLabel(
                content: StringConstants.Success.success,
                color: .black,
                fontToken: .size36,
                style: .bold
            )
            TextLabel(
                content: StringConstants.Success.Congrats,
                color: .grey,
                fontToken: .size21,
                style: .bold
            )
            .multilineTextAlignment(.center)
            
            Spacer(minLength: 202)
                .fixedSize()
            
            Button(title: StringConstants.Success.signIn, action: {})
            .button {
                router.popTo(.signIn)
            }
            
        }
    }
}

struct SuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessScreen()
    }
}

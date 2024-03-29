import SwiftUI

public struct ReserveSuccessScreen: View {
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
                content: StringConstants.ReserveSuccess.success,
                color: .black,
                fontToken: .size27,
                style: .bold
            )
            
            Spacer(minLength: 12)
                .fixedSize()
            
            TextLabel(
                content: StringConstants.ReserveSuccess.Congrats,
                color: .grey,
                fontToken: .size17,
                style: .regular
            )
            .multilineTextAlignment(.center)
            
            Spacer(minLength: 190)
                .fixedSize()
            
            Button(
                title: StringConstants.ReserveSuccess.backtohomepage,
                action: {
                    router.push(.home)
                }
            )
            
        }
    }
}

struct ReserveSuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReserveSuccessScreen()
    }
}

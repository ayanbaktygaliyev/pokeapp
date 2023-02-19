import SwiftUI

public struct SuccessScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    public var body: some View {
        ZStack {
            Circle()
                
            Image(asset: .check)
                .foregroundColor(Color(.foodieGreen))
        }
    }
}

struct SuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessScreen()
    }
}

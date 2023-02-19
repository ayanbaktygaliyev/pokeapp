import SwiftUI

public struct SignUpScreen: View {
//    @StateObject
//    private var viewModel = SignUpViewModel()
    
    public var body: some View {
        VStack(alignment: .center, spacing: .spacing0) {
            Logo(fontToken: .size50)
                .padding(.top, 48)
            
            Spacer(minLength: 95)
                .fixedSize()
            
            TextLabel(
                content: StringConstants.SignIn.welcome,
                color: .black,
                fontToken: .size17,
                style: .regular
            )
            .multilineTextAlignment(.center)
            
            Spacer(minLength: 40)
                .fixedSize()
            
            TextField(text: $viewModel.state.username, placeholder: StringConstants.SignIn.username)
            TextField(text: $viewModel.state.password, placeholder: StringConstants.SignIn.password)
            
            Spacer(minLength: 200)
            
            Button(title: StringConstants.SignIn.signIn, action: {})
            
            Spacer(minLength: 32)
                .fixedSize()
            
            HStack(spacing: .spacing2) {
                TextLabel(
                    content: StringConstants.SignIn.noAccount,
                    color: .black,
                    fontToken: .size15,
                    style: .regular
                )
                
                TextLabel(
                    content: StringConstants.SignIn.createAccount,
                    color: .foodieGreen,
                    fontToken: .size15,
                    style: .regular
                )
                .button {
                    print("Hello")
                }
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

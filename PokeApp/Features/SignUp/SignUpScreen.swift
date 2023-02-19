import SwiftUI

public struct SignUpScreen: View {
    @StateObject
    private var viewModel = SignUpViewModel()
    
    public var body: some View {
        VStack(alignment: .center, spacing: .spacing0) {
            Logo(fontToken: .size50)
                .padding(.top, 48)
            
            Spacer(minLength: 95)
                .fixedSize()
            
            TextLabel(
                content: StringConstants.SignUp.getStarted,
                color: .black,
                fontToken: .size17,
                style: .regular
            )
            .multilineTextAlignment(.center)
            
            Spacer(minLength: 40)
                .fixedSize()
            
            TextField(text: $viewModel.state.username, placeholder: StringConstants.SignUp.username)
            TextField(text: $viewModel.state.password, placeholder: StringConstants.SignUp.password)
            
            Spacer(minLength: 200)
            
            Button(title: StringConstants.SignUp.signUp, action: viewModel.didTapSignUp)
            
            Spacer(minLength: 32)
                .fixedSize()
            
            HStack(spacing: .spacing2) {
                TextLabel(
                    content: StringConstants.SignUp.haveAcoount,
                    color: .black,
                    fontToken: .size15,
                    style: .regular
                )
                
                TextLabel(
                    content: StringConstants.SignUp.signIn,
                    color: .foodieGreen,
                    fontToken: .size15,
                    style: .regular
                )
                .button {
                    print("Hello from sign in")
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

import SwiftUI

public struct SignInScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = SignInViewModel()
    
    public var body: some View {
        content
            .onChange(of: viewModel.state.status) { status in
                guard case .signedIn = status else {
                    return
                }
                
                router.push(.home)
            }
    }
}

private extension SignInScreen {
    private var content: some View {
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
            
            Button(
                title: StringConstants.SignIn.signIn,
                action: {
                    viewModel.signIn()
                }
            )
            
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
                    router.push(.signUp)
                }
            }
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}

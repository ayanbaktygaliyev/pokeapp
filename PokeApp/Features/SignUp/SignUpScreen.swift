import SwiftUI

public struct SignUpScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: SignUpViewModel
    
    public var body: some View {
        content
            .onChange(of: viewModel.state.status) { status in
                guard case .signedUp = status else {
                    return
                }
                
                router.push(.success)
            }
            .overlay(if: viewModel.state.isSigningUp) {
                Spinner(.underlay)
            }
            .overlay(if: viewModel.state.isShowingDialog) {
                Dialog(
                    isShowingDialog: $viewModel.state.isShowingDialog,
                    title: StringConstants.App.error,
                    subtitle: viewModel.state.error ?? "",
                    colorToken: .foodieGreen
                )
            }
    }
}

private extension SignUpScreen {
    private var content: some View {
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
            
            TextField(
                text: $viewModel.state.inputs.username,
                placeholder: StringConstants.SignUp.username,
                status: viewModel.state.inputs.validated?.failureReasons
                    .firstMatch([.usernameNotInput])
                    .map { .error(message: $0.description) } ?? .normal
            )
            TextField(
                text: $viewModel.state.inputs.password,
                placeholder: StringConstants.SignUp.password,
                status: status(
                    viewModel.state.inputs,
                    for: [
                        .passwordNotInput,
                        .passwordIsLessThan7Characters,
                        .passwordDoesNotHaveNumbers
                    ]
                )
            )
            
            Spacer(minLength: 200)
            
            Button(
                title: StringConstants.SignUp.signUp,
                action: {
                    viewModel.send(event: .signUp)
                }
            )
            
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
                    router.popTo(.signIn)
                }
            }
        }
    }
    
    private func status(
        _ inputs: SignUpInputs,
        for filter: Set<SignUpInputs.FailureReason>
    ) -> TextField.Status {
        guard let error = inputs.validated?.failureReasons.firstMatch(filter)?.description else {
            return .normal
        }

        return .error(message: error.isEmpty ? nil : error)
    }
}

private extension SignUpInputs.FailureReason {
    var description: String {
        switch self {
        case .usernameNotInput:
            return StringConstants.SignUp.usernameNotInput

        case .passwordNotInput:
            return StringConstants.SignUp.passwordNotInput
            
        case .passwordIsLessThan7Characters:
            return StringConstants.SignUp.passwordIsLessThan7Characters
            
        case .passwordDoesNotHaveNumbers:
            return StringConstants.SignUp.passwordDoesNotHaveNumbers
        }
    }
}

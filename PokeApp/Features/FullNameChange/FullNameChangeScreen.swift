import SwiftUI

public struct FullNameChangeScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: FullNameChangeScreenViewModel
    
    public var body: some View {
        content
            .overlay(if: viewModel.state.isShowingDialog) {
                Dialog(
                    isShowingDialog: $viewModel.state.isShowingDialog,
                    title: StringConstants.App.error,
                    subtitle: "Make sure that you've confirmed your full name correctly",
                    colorToken: .foodieGreen
                )
                .frame(width: UIScreen.main.bounds.width)
            }
    }
    
    private var content: some View {
        VStack(alignment: .leading){
            
            ZStack {
                Circle()
                    .fill(.black.opacity(0.2))
                    .frame(width: 32, height: 32)
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 12)
            }
            .button {
                router.pop()
            }
            
            Spacer()
            
            greeting

            Spacer(minLength: 70)
                .fixedSize()
            
            
            VStack(alignment: .leading){
            
                TextLabel(
                    content: "Change fullname",
                    color: .black,
                    fontToken: .size20,
                    style: .bold
                )
                
                Spacer()
                    .fixedSize()
                
                TextLabel(
                    content: "Enter your new fullname below:",
                    color: .grey,
                    fontToken: .size16,
                    style: .bold
                )
                
                Spacer(minLength: 35)
                    .fixedSize()
            }


            usernameEdit
            
            Spacer(minLength: 35)
                .fixedSize()
            

            Spacer(minLength: 205)
                .fixedSize()
            
            saveButton
                .frame(alignment: .center)
                .padding(.leading, -16)
                .button {
                    viewModel.changeFullname {
                        router.pop()
                    }
                }
        }
    }
    
    private var greeting: some View{
        TextLabel(
            content: "Hi, \(viewModel.userRepository.fullname)!",
            color: .black,
            fontToken: .size24,
            style: .bold
        )
    }
    
    private var saveButton: some View{
        ZStack(alignment: .center){
            Rectangle()
                .fill(Color(.foodieGreen))
                .frame(width: 343, height: 56)
                .cornerRadius(15)
            
            TextLabel(
                content: "Save",
                color: .white,
                fontToken: .size17,
                style: .medium
            )
        }
    }
    
    private var usernameEdit: some View{

        VStack(alignment: .leading ,spacing: 23){
            
            TextLabel(
                content: "New fullname:",
                color: .grey,
                fontToken: .size15,
                style: .bold
            )
            
            SwiftUI.TextField("", text: $viewModel.state.fullname)
                .padding(.leading, 10)
                .frame(width: 327, height: 48)
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    )

            
            TextLabel(
                content: "Confirm fullname:",
                color: .grey,
                fontToken: .size15,
                style: .bold
            )
            
            SwiftUI.TextField("", text: $viewModel.state.confirmFullname)
                .padding(.leading, 10)
                .frame(width: 327, height: 48)
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    )
        }
    }
}

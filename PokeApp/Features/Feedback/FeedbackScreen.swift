import SwiftUI

public struct FeedbackScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = FeedbackScreenViewModel()
    
    public var body: some View {
        content
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
            .padding(.top, 0)
            .padding(.leading, 16)
            .frame(alignment: .leading)
            .button {
                router.pop()
            }
            
            Spacer(minLength: 25)
                .fixedSize()
            
            greeting
                .frame(alignment: .leading)
                .padding(.leading, 16)
            
            Spacer(minLength: 70)
                .fixedSize()
            
            TextLabel(
                content: "Please, leave your feedback\nbelow:",
                color: .black,
                fontToken: .size20,
                style: .bold
            )
            .frame(alignment: .leading)
            .padding(.leading, 16)
            
            SwiftUI.TextEditor(text: $viewModel.state.feedback)
                .frame(height: 202, alignment: .top)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                        .padding(.bottom, 15)
                )
                .padding(.top, 15)
                .padding(.horizontal, 16)
            
            Spacer(minLength: 35)
            
            
            Button(
                title: "Submit",
                action: {
                    router.pop()
                }
            )
            
            Spacer(minLength: 20)
                .fixedSize()
                
            
        }
    }
    
    private var greeting: some View{
        TextLabel(
            content: "Hi, \(UserDefaults.standard.string(forKey: "fullname") ?? "")",
            color: .black,
            fontToken: .size24,
            style: .bold
        )
    }
}
    


    

struct FeedbackScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackScreen()
    }
}

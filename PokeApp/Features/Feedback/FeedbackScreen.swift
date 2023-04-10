import SwiftUI

public struct FeedbackScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = FeedbackScreenViewModel()
    
    public var body: some View {
        
        content
            .padding(.leading, 16)
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
            .button {
                router.pop()
            }
            
            Spacer(minLength: 25)
                .fixedSize()
            
            greeting
            
            Spacer(minLength: 70)
                .fixedSize()
            
            TextLabel(
                content: "Please, leave your feedback\nbelow:",
                color: .black,
                fontToken: .size20,
                style: .bold
            )
            .frame(width: 343, alignment: .leading)
            
            
            
            Spacer(minLength: 35)
                .fixedSize()
            
            
            
            SubmitButton
                .frame(alignment: .center)
            
            Spacer(minLength: 265)
                
            
        }
    }
    
    private var greeting: some View{
        TextLabel(
            content: "Hi, PokeApp Creator!",
            color: .black,
            fontToken: .size24,
            style: .bold
        )
    }
    

    
    
    private var SubmitButton: some View {
        HStack {
            ZStack(alignment: .center){
                
                Rectangle()
                    .fill(Color(.foodieGreen))
                    .frame(width: 122, height: 33, alignment: .center)
                    .cornerRadius(15)
                
                
                TextLabel(
                    content: "Submit",
                    color: .white,
                    fontToken: .size17,
                    style: .medium
                )
                
            }
            
        }
        .frame(alignment: .center)
        
    }
}
    


    

struct FeedbackScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackScreen()
    }
}

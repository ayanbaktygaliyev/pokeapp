import SwiftUI

public struct UsernameSettingsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = UsernameSettingsScreenViewModel()
    
    public var body: some View {
        
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading){
            
            greeting

            Spacer(minLength: 70)
                .fixedSize()
            
            TextLabel(
                content: "Change Username",
                color: .black,
                fontToken: .size20,
                style: .bold
            )
            
            Spacer()
                .fixedSize()
            
            TextLabel(
                content: "Enter your new username below:",
                color: .grey,
                fontToken: .size16,
                style: .bold
            )
            
            Spacer(minLength: 35)
                .fixedSize()

            usernameEdit
            
            SaveButton

            Spacer(minLength: 265)
                .fixedSize()

            logOutButton
            
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
    
    private var logOutButton: some View{
        ZStack(alignment: .center){
            Rectangle()
                .fill(Color(.foodieGreen))
                .frame(width: 343, height: 56)
                .cornerRadius(15)
            
            TextLabel(
                content: "Log Out",
                color: .white,
                fontToken: .size17,
                style: .medium
            )
            
        }
        
    }
    
    private var usernameEdit: some View{

        VStack(alignment: .leading ,spacing: 23){
            
            TextLabel(
                content: "New Username:",
                color: .grey,
                fontToken: .size15,
                style: .bold
            )
            
//            TextField(text: "Message...", placeholder: $viewModel.username)
//                .frame(height: 30)
//                .padding(10)
            TextLabel(
                content: "Confirm Username:",
                color: .grey,
                fontToken: .size15,
                style: .bold
            )
        }
    }
}
    
    private var SaveButton: some View {
        HStack {
            ZStack(alignment: .center){
                
                Rectangle()
                    .fill(Color(.foodieGreen))
                    .frame(width: 122, height: 33, alignment: .center)
                    .cornerRadius(15)
                
                
                TextLabel(
                    content: "Save",
                    color: .white,
                    fontToken: .size17,
                    style: .medium
                )
                
            }

        }
        .frame(alignment: .center)
        
    }
    


    

struct UsernameSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsernameSettingsScreen()
    }
}

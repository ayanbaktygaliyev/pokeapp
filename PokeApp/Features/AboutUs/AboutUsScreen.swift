import SwiftUI

public struct AboutUsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = AboutUsScreenViewModel()
    
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
            .button {
                router.pop()
            }
            
            TextLabel(
                content: "Foodie",
                color: .foodieGreen,
                fontToken: .size36,
                style: .bold
            )
            
            Spacer(minLength: 30)
                .fixedSize()
            
            VStack(alignment: .center){
                
                TextLabel(
                    content: "Creators",
                    color: .black,
                    fontToken: .size20,
                    style: .bold
                )
                
                
                Spacer(minLength: 15)
                    .fixedSize()
                
                creators
                
                Spacer(minLength: 30)
                    .fixedSize()
                
                TextLabel(
                    content: "Adviser",
                    color: .black,
                    fontToken: .size20,
                    style: .bold
                )
                
                
                Spacer(minLength: 15)
                    .fixedSize()
                
                ZStack(alignment: .center){
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 327, height: 64)
                        .cornerRadius(11)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        
                    HStack{
                            TextLabel(
                                content: "Meiram Murzabulatov",
                                color: .black,
                                fontToken: .size17,
                                style: .regular
                            )
                            .padding(.leading, 18)
                            
                            Spacer(minLength: 0)
                            
                        }
                    .frame(width: 327, alignment: .leading)
                }
                
                
            }
            
            Spacer()
            
            
            
        }
    }
    
    private var creators: some View {
        ZStack(alignment: .leading){
            
            Rectangle()
                .fill(.white)
                .frame(width: 327, height: 147)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .leading ,spacing: 20){
                
                HStack{
    
                    
                    TextLabel(
                        content: "Margulan Daribayev",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)

                }
                
                HStack{
    
                    
                    TextLabel(
                        content: "Ayan Baktygaliyev",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)

                }
                
                HStack{
    
                    
                    TextLabel(
                        content: "Zakhar Semenov",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)

                }
                
                

            }
            .frame(width: 327)
            
            
        }
    }

}
    


    

struct AboutUsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsScreen()
    }
}

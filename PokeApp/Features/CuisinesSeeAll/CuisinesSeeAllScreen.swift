import SwiftUI

public struct CuisinesSeeAllScreen: View {
    @EnvironmentObject
    private var router: Router<Route>

    @StateObject
    var viewModel = CuisinesSeeAllViewModel()

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            
            headerView
                .padding(.trailing, 16)
            
            topicView
            
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing16) {
                    
                    Spacer()
                        .fixedSize()
                    
                    cuisinesSection
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            HStack {
                Image(asset: .locationPin)
                    .resizable()
                    .frame(width: 20, height: 27)
                
                TextLabel(
                    content: StringConstants.App.yourLocation,
                    color: .foodieGreen,
                    fontToken: .size16,
                    style: .semibold
                )
            }
            
            Spacer()
            
            Logo(fontToken: .size20)
        }
    }
    
    private var topicView: some View {
        HStack(alignment: .bottom){
            
            ZStack {
                Circle()
                    .fill(.black.opacity(0.48))
                    .frame(width: 32, height: 32)
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 12)
            }            .button {
                router.pop()
            }
            
            Spacer()
                .fixedSize()
            
            TextLabel(
                content: "Cuisines",
                color: .black,
                fontToken: .size24,
                style: .bold
            )
            .padding(.leading, 10)
            
        }
    }
    
    private var cuisinesSection: some View {
        VStack(spacing: .spacing6) {
            
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: adaptiveColumns){
                            ForEach(0..<10) { index in
                                SeeAllCuisineCard.stub()
                                    .frame(width: 140, height: 190)
                    }
                }
            }
            .padding(.trailing, 16)
        }
    }
}

struct CuisinesSeeAllScreen_Previews: PreviewProvider {
    static var previews: some View {
        CuisinesSeeAllScreen()
    }
}

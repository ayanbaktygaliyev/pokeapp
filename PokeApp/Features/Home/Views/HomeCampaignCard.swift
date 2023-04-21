import SwiftUI

struct HomeCampaignCard: View {
    let campaign: Campaign
    
    var body: some View {
        content
    }
}

private extension HomeCampaignCard {
    private var content: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(
                url: campaign.imageURL,
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 343, height: 164)
                        .cornerRadius(15)
                        .brightness(-0.16)
                },
                placeholder: {
                    FoodiePlaceholderImage()
                        .frame(width: 343, height: 164)
                        .cornerRadius(15)
                        .brightness(-0.16)
                }
            )
            
            VStack(alignment: .leading, spacing: .spacing6) {
                TextLabel(
                    content: campaign.title,
                    color: .white,
                    fontToken: .size16,
                    style: .bold
                )
                
                TextLabel(
                    content: campaign.title,
                    color: .white,
                    fontToken: .size10,
                    style: .semibold
                )
            }
            .padding(.leading, 16)
            .padding(.bottom, 30)
        }
    }
}

extension HomeCampaignCard {
    static func stub() -> Self {
        HomeCampaignCard(
            campaign: HomeViewModel.stub().first.unsafelyUnwrapped
        )
    }
}

struct HomeCampaignCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCampaignCard.stub()
    }
}

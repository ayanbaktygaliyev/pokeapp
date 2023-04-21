import SwiftUI

struct FoodiePlaceholderImage: View {
    var body: some View {
        Image(asset: .foodiePlaceholder)
            .resizable()
            .scaledToFill()
    }
}

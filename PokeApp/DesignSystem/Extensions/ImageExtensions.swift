import SwiftUI

public extension Image {
    init(asset: ImageAsset) {
        self.init(asset.rawValue)
    }
}

import SwiftUI

public extension Image {
    init(asset: ImageAsset) {
        if case .system(let systemAsset) = asset {
            self.init(systemName: systemAsset.rawValue)
        } else {
            self.init(asset.rawValue)
        }
    }
}


import Foundation

public protocol AppboyTracker {
    func logCustomEvent(_ eventName: String)
}
 
struct MockAppboyTracker: AppboyTracker {
    func logCustomEvent(_ eventName: String) {}
}

import SettingsFeature
import ProductsFeature

public struct AppFeatureDependencies {
    let settingsDependencies: SettingsDependencies
    let productDependencies: ProductsDependencies
    
    public init(
        settingsDependencies: SettingsDependencies,
        productDependencies: ProductsDependencies
    ) {
        self.settingsDependencies = settingsDependencies
        self.productDependencies = productDependencies
    }
}

// MARK: - Mocks

extension AppFeatureDependencies {
    
    static var mock: AppFeatureDependencies {
        Self(
            settingsDependencies: .mock,
            productDependencies: .mock
        )
    }
}


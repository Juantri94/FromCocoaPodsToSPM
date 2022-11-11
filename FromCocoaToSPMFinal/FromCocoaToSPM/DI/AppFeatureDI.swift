
import Foundation
//import Appboy_iOS_SDK
import AppboyKit // SPM

extension Appboy: AppboyTracker { }

import AppFeature
import SettingsFeature
import ProductsFeature

extension AppFeatureDependencies {
    
    static var dependencies: AppFeatureDependencies {
        Self(
            settingsDependencies: .dependencies,
            productDependencies: .dependencies
        )
    }
}


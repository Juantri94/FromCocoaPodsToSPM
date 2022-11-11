import UIKit
//import Appboy_iOS_SDK
import AppboyKit // SPM
import Amplitude

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        // Init appboy
        Appboy.start(
            withApiKey: "",
            in: application)
        
        // Init amplitude
        Amplitude.instance().trackingSessionEvents = true
        Amplitude.instance().initializeApiKey("")
        Amplitude.instance().setUserId("userId")
        Amplitude.instance().logEvent("app_start")
        
        return true
    }

}

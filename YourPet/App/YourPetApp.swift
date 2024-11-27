import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct YourPetApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var router = Router()
  
  var body: some Scene {
    WindowGroup {
      if #available(iOS 16.0, *) {
        ContentView(router: router)
      } else {
        Text("This app requires iOS 16.0 or newer.")
      }
    }
  }
}

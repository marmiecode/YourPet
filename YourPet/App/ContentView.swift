import SwiftUI

struct ContentView: View {
  @StateObject var router = Router()
  @StateObject var authViewModel = AuthViewModel()
  
  var body: some View {
    NavigationStack(path: $router.currentPath) {
      if authViewModel.isAuthenticated {
        MainTabBarView()
          .environmentObject(router)
          .environmentObject(authViewModel)
      } else {
        LoginView()
          .environmentObject(authViewModel)
          .environmentObject(router)
      }
    }
    .navigationDestination(for: Router.Route.self) { route in
      switch route {
      case .home:
        HomeView()
          .environmentObject(router)
      case .qrCode:
        QrCodeView()
          .environmentObject(router)
          .environmentObject(authViewModel)
      case .map:
        MapView()
          .environmentObject(router)
          .environmentObject(authViewModel)
      }
    }
  }
}

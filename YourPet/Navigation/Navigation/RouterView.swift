import SwiftUI

@available(iOS 16.0, *)
struct RouterView<Content: View>: View {
  @ObservedObject var router: Router
  @EnvironmentObject var authViewModel: AuthViewModel
  let content: () -> Content
  
  var body: some View {
    NavigationStack(path: $router.currentPath) {
      content()
        .navigationDestination(for: Router.Route.self) { route in
          switch route {
          case .home:
            HomeView()
          case .qrCode:
            QrCodeView()
          case .map:
            MapView()
          case .login:
            LoginView()
          case .register:
            RegisterView()
          case .qrCodeDetails, .mapDetails:
            Text("Detail View") // Tymczasowa obsługa
          }
        }
    }
  }
}

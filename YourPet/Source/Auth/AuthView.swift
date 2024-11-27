import SwiftUI

struct AuthView: View {
  @EnvironmentObject var authManager: AuthManager
  @State private var navDestination: NavigationDestination?
  
  var body: some View {
    ZStack {
      if let isLoggedIn = authManager.isUserLoggedIn {
        if isLoggedIn {
          if #available(iOS 16.0, *) {
            NavigationStack {
              NavigationLink(destination: MainTabBarView()) {
                Text("Przejdź do aplikacji")
              }
            }
          } else {
            NavigationView {
              NavigationLink(destination: MainTabBarView()) {
                Text("Przejdź do aplikacji")
              }
            }
          }
        } else {
          if #available(iOS 16.0, *) {
            NavigationStack {
              LoginView()
            }
          } else {
            NavigationView {
              LoginView()
            }
          }
        }
      } else {
        ProgressView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}

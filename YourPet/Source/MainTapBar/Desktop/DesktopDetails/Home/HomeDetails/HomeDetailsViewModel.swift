import Combine

final class HomeDetailsViewModel: ObservableObject, Identifiable {
  let title = "Im a Home view DETAILS"
  let navigationTitle = "Home DETAILS"
  private var authManager: AuthManager

  init(authManager: AuthManager) {
    self.authManager = authManager
  }
  
  func signOut() {
    authManager.signOut { error in
      
    }
  }
}

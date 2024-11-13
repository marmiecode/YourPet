import Combine

final class QrCodeDetailsViewModel: ObservableObject {
  let title = "Im a QR view DETAILS"
  let navigationTitle = "QR DETAILS"
  private var authManager: AuthManager

  init(authManager: AuthManager) {
    self.authManager = authManager
  }
  
  func signOut() {
    authManager.signOut { error in
      
    }
  }
}

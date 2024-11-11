import Combine
import SwiftUI

final class AuthViewModel: ObservableObject {
  @Published var isUserLoggedIn: Bool?
  private var authManager: FirebaseAuthService
  private var cancellables = Set<AnyCancellable>()
  
  init(authManager: FirebaseAuthService = FirebaseAuthService()) {
    self.authManager = authManager
    setupAuthStateListener()
  }
  
  private func setupAuthStateListener() {
    authManager.isUserLoggedInPublisher
      .assign(to: &$isUserLoggedIn)
  }
}

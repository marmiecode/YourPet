import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
  @Published var isAuthenticated: Bool = false
  @Published var email: String = ""
  @Published var password: String = ""
  
  private var authService: FirebaseAuthServiceProtocol
  
  init(authService: FirebaseAuthServiceProtocol = FirebaseAuthService()) {
    self.authService = authService
    checkIfLoggedIn()
  }
  
  func login() {
    authService.login(email: email, password: password) { [weak self] success in
      DispatchQueue.main.async {
        self?.isAuthenticated = success
      }
    }
  }
  
  func register() {
    authService.register(email: email, password: password) { [weak self] success in
      DispatchQueue.main.async {
        self?.isAuthenticated = success
      }
    }
  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
      isAuthenticated = false
    } catch let error {
      print("Error signing out: \(error.localizedDescription)")
    }
  }
  
  private func checkIfLoggedIn() {
    isAuthenticated = Auth.auth().currentUser != nil
  }
}



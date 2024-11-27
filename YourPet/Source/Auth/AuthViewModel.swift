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
  
  func login(email: String, password: String) async {
    do {
      let result = try await authService.login(email: email, password: password)
      DispatchQueue.main.async {
        self.isAuthenticated = result
      }
    } catch {
      print("Login failed: \(error.localizedDescription)")
    }
  }
  
  func register(email: String, password: String) async throws {
    do {
      try await authService.register(email: email, password: password)
      DispatchQueue.main.async {
        self.isAuthenticated = true
      }
    } catch {
      throw error
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

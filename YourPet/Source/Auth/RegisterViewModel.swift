import Foundation

@MainActor
final class RegisterViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  private let authViewModel: AuthViewModel
  
  init(authViewModel: AuthViewModel) {
    self.authViewModel = authViewModel
  }
  
  func register() async -> Bool {
    guard !email.isEmpty, !password.isEmpty else {
      errorMessage = "Email and password cannot be empty."
      return false
    }
    
    isLoading = true
    defer { isLoading = false }
    
    do {
      await authViewModel.register(email: email, password: password)
      return true
    } catch {
      errorMessage = error.localizedDescription
      return false
    }
  }
}

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject, Identifiable {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?
  
  func register() {
    isLoading = true
    errorMessage = nil
    
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      DispatchQueue.main.async {
        self?.isLoading = false
        
        if let error = error {
          self?.errorMessage = error.localizedDescription
        } else {
          // Handle successful registration, e.g., navigate back to login or proceed to the main content
        }
      }
    }
  }
}

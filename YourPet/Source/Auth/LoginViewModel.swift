import Foundation
import Combine
import FirebaseAuth

class LoginViewModel: ObservableObject, Identifiable {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?
  
  private var cancellables = Set<AnyCancellable>()
  
  func login() {
    isLoading = true
    errorMessage = nil
    
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
      DispatchQueue.main.async {
        self?.isLoading = false
        
        if let error = error {
          self?.errorMessage = error.localizedDescription
        } else {
          // Handle successful login, navigate to the main content view
        }
      }
    }
  }
}

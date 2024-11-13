import SwiftUI
import FirebaseAuth

final class AuthManager: NSObject, ObservableObject {
  @Published var isUserLoggedIn: Bool?
  
  override init() {
    super.init()
    setupAuthStateChangeListener()
  }
  
  private func setupAuthStateChangeListener() {
    Auth.auth().addStateDidChangeListener { [weak self] auth, user in
      guard let self else { return }
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        self.isUserLoggedIn = user != nil
        print("user != \(self.isUserLoggedIn)")
      }
    }
  }
  
  func signOut(completion: @escaping (Error?) -> Void) {
    do {
      try Auth.auth().signOut()
      completion(nil)
    } catch let signOutError as NSError {
      completion(signOutError)
    }
  }
}

extension AuthManager {
  func createAccount(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if let error = error {
        completion(error)
      } else {
        completion(nil)
      }
    }
  }
  
  func signInWithEmail(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if let error = error {
        completion(error)
      } else {
        completion(nil)
      }
    }
  }
}


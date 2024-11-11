import SwiftUI
import FirebaseAuth

final class AuthManager: NSObject, ObservableObject {
  @Published var isUserLoggedIn: Bool?
  
  override init() {
    super.init()
    setupAuthStateChangeListener()
  }
  
  /// Sets up the authentication state change listener to track user login status.
  private func setupAuthStateChangeListener() {
    Auth.auth().addStateDidChangeListener { [weak self] auth, user in
      guard let self else { return }
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        self.isUserLoggedIn = user != nil
        // TODO: REMOVE it
        print("user != \(self.isUserLoggedIn)")
      }
    }
  }
  
  /// Signs out the current user.
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
  
  // MARK: Create Account
  
  /// Creates a new user account with the provided email and password.
  /// - Parameters:
  ///   - email: User's email address.
  ///   - password: User's desired password.
  ///   - completion: Closure called upon completion with an optional error.
  func createAccount(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if let error = error {
        completion(error)
      } else {
        completion(nil)
      }
    }
  }
  
  // MARK: Sign In with Email and Password
  
  /// Signs in the user with the provided email and password.
  /// - Parameters:
  ///   - email: User's email address.
  ///   - password: User's password.
  ///   - completion: Closure called upon completion with an optional error.
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


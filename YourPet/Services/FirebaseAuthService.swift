import FirebaseAuth

protocol FirebaseAuthServiceProtocol {
  func login(email: String, password: String, completion: @escaping (Bool) -> Void)
  func register(email: String, password: String, completion: @escaping (Bool) -> Void)
}

class FirebaseAuthService: FirebaseAuthServiceProtocol {
  func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      completion(error == nil)
    }
  }
  
  func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      completion(error == nil)
    }
  }
}


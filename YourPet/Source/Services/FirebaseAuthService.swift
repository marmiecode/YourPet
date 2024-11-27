import FirebaseAuth

protocol FirebaseAuthServiceProtocol {
  func login(email: String, password: String) async throws -> Bool
  func register(email: String, password: String) async throws
}

final class FirebaseAuthService: FirebaseAuthServiceProtocol {
  func login(email: String, password: String) async throws -> Bool {
    let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
    return authResult.user != nil
  }
  
  func register(email: String, password: String) async throws {
    _ = try await Auth.auth().createUser(withEmail: email, password: password)
  }
}

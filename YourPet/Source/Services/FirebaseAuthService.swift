import FirebaseAuth
import Combine

protocol FirebaseAuthServiceProtocol {
  var isUserLoggedInPublisher: AnyPublisher<Bool?, Never> { get }
  func login(email: String, password: String)
  func register(email: String, password: String)
}

final class FirebaseAuthService: FirebaseAuthServiceProtocol {
  @Published private var isUserLoggedIn: Bool?
  var isUserLoggedInPublisher: AnyPublisher<Bool?, Never> {
    $isUserLoggedIn.eraseToAnyPublisher()
  }
  
  func login(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
      self?.isUserLoggedIn = (error == nil)
    }
  }
  
  func register(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
      self?.isUserLoggedIn = (error == nil)
    }
  }
}

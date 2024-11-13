import SwiftUI
import FirebaseAuth

struct ContentView: View {
  @State private var isLoggedIn = Auth.auth().currentUser != nil
  
  var body: some View {
    NavigationView {
      if isLoggedIn {
        Text("Welcome! You are logged in.")
          .navigationTitle("Home")
          .toolbar {
            Button("Logout") {
              logout()
            }
          }
      } else {
        LoginView()
      }
    }
    .onAppear {
      checkAuthentication()
    }
  }
  
  private func logout() {
    do {
      try Auth.auth().signOut()
      isLoggedIn = false
    } catch {
      print("Failed to log out: \(error.localizedDescription)")
    }
  }
  
  private func checkAuthentication() {
    Auth.auth().addStateDidChangeListener { _, user in
      isLoggedIn = user != nil
    }
  }
}

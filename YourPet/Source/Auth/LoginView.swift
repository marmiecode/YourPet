import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel: LoginViewModel
  @EnvironmentObject var router: Router
  
  init(authViewModel: AuthViewModel) {
    _viewModel = StateObject(wrappedValue: LoginViewModel(authViewModel: authViewModel))
  }
  
  var body: some View {
    VStack(spacing: 16) {
      TextField("Email", text: $viewModel.email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      if let errorMessage = viewModel.errorMessage {
        Text(errorMessage)
          .foregroundColor(.red)
          .font(.footnote)
      }
      
      Button("Log in") {
        Task {
          let success = await viewModel.login()
          if success {
            router.navigate(to: .home)
          }
        }
      }
      .buttonStyle(.borderedProminent)
      
      Button("Go to Register") {
        router.navigate(to: .register)
      }
    }
    .padding()
  }
}

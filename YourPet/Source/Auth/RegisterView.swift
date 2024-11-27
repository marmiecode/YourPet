import SwiftUI

struct RegisterView: View {
  @StateObject private var viewModel: RegisterViewModel
  @EnvironmentObject var authViewModel: AuthViewModel
  @EnvironmentObject var router: Router
  
  init(authViewModel: AuthViewModel) {
    _viewModel = StateObject(wrappedValue: RegisterViewModel(authViewModel: authViewModel))
  }
  
  var body: some View {
    VStack(spacing: 16) {
      TextField("Email", text: $viewModel.email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(true)
      
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      if let errorMessage = viewModel.errorMessage {
        Text(errorMessage)
          .foregroundColor(.red)
          .font(.footnote)
      }
      
      Button("Register") {
        Task {
          let success = await viewModel.register()
          if success {
            router.navigate(to: .home)
          }
        }
      }
      .buttonStyle(.borderedProminent)
      .disabled(viewModel.isLoading)
      
      // Przycisk powrotu do ekranu logowania
      Button("Back to Login") {
        router.pop()
      }
    }
    .padding()
  }
}

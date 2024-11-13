import SwiftUI

struct RegisterView: View {
  @StateObject private var viewModel = RegisterViewModel()
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    VStack {
      Text("Register")
        .font(.largeTitle)
        .bold()
      
      TextField("Email", text: $viewModel.email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .padding(.horizontal)
      
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)
      
      if let errorMessage = viewModel.errorMessage {
        Text(errorMessage)
          .foregroundColor(.red)
          .padding(.horizontal)
      }
      
      Button("Register") {
        viewModel.register()
      }
      .padding()
      .disabled(viewModel.isLoading)
      
      Button("Already have an account? Login") {
        dismiss()
      }
      .padding()
    }
    .padding()
    .navigationTitle("Register")
  }
}

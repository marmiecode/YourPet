import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel = LoginViewModel()
  @State private var showRegister = false
  
  var body: some View {
    VStack {
      Text("Login")
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
      
      Button("Login") {
        viewModel.login()
      }
      .padding()
      .disabled(viewModel.isLoading)
      
      Button("Don't have an account? Register") {
        showRegister.toggle()
      }
      .padding()
      .sheet(isPresented: $showRegister) {
        RegisterView()
      }
    }
    .padding()
    .navigationTitle("Login")
  }
}


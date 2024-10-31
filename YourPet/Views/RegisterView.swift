import SwiftUI

struct RegisterView: View {
  @EnvironmentObject var viewModel: AuthViewModel 
  var body: some View {
    VStack {
      TextField("Email", text: $viewModel.email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .padding()
      
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      Button("Register") {
        viewModel.register()
      }
      .padding()
      
      if viewModel.isAuthenticated {
        Text("Registration successful! Please log in.")
          .foregroundColor(.green)
          .padding()
      }
    }
    .padding()
    .navigationTitle("Register")
  }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView().environmentObject(AuthViewModel())
  }
}
#endif



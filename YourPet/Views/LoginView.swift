import SwiftUI

struct LoginView: View {
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
      
      Button("Log in") {
        viewModel.login()
      }
      .padding()
      
      NavigationLink("Don't have an account? Register", destination: RegisterView().environmentObject(viewModel))
    }
    .padding()
    .navigationTitle("Login")
  }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView().environmentObject(AuthViewModel())
  }
}
#endif




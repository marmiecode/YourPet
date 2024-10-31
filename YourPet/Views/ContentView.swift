import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = AuthViewModel()
  
  var body: some View {
    NavigationView {
      if viewModel.isAuthenticated {
        MainView()
      } else {
        LoginView()
          .environmentObject(viewModel) 
      }
    }
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif



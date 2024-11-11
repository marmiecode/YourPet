import SwiftUI

struct AuthView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  @State private var navDestination: NavigationDestination?
  
  @ViewBuilder
  var body: some View {
    ZStack {
      // TODO: change isUserLoggedIn to enum with state loading userloggedIn and userNotLogged
      if viewModel.isUserLoggedIn == true {
        NavigationDestination
          .mainTabBar(viewModel: viewModel.getMainTabBarViewModel())
          .buildNavDestinationView
      } else if viewModel.isUserLoggedIn == false {
        NavigationStack {
          NavigationDestination
            .login(viewModel: viewModel.getLoginViewModel())
            .buildNavDestinationView
        }
      }
      
      if viewModel.isUserLoggedIn == nil {
        ProgressView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
      .environmentObject(AuthViewModel())
  }
}


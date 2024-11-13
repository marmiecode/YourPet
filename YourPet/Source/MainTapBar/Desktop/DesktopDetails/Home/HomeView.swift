import SwiftUI

struct HomeView: View {
  @EnvironmentObject var viewModel: HomeViewModel
  @State private var navDestination: NavigationDestination?

  var body: some View {
    VStack {
      Button("Home details") {
        navDestination = .homeDetails(viewModel: viewModel.getHomeDetailsViewModel())
      }
    }
    .navigationTitle("Home")
    .navigationListener($navDestination)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(HomeViewModel(authManager: AuthManager()))
  }
}

import SwiftUI

struct HomeDetailsView: View {
  @EnvironmentObject var viewModel: HomeDetailsViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
      Button {
        viewModel.signOut()
      } label: {
        Text("Wyloguj się")
      }
    }
    .navigationTitle(viewModel.navigationTitle)
  }
}

struct HomeDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    HomeDetailsView()
      .environmentObject(HomeDetailsViewModel(authManager: AuthManager()))
  }
}

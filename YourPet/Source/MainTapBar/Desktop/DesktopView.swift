import SwiftUI

struct DesktopView: View {
  @EnvironmentObject var viewModel: DesktopViewModel
  @State private var navDestination: NavigationDestination?
  
  var body: some View {
    VStack {
      Button("Desktop details") {
        navDestination = .desktopDetails(viewModel: viewModel.getDesktopDetailsViewModel())
      }
    }
    .navigationTitle("Profile")
    .navigationListener($navDestination)
  }
}

struct DesktopView_Previews: PreviewProvider {
  static var previews: some View {
    DesktopView()
      .environmentObject(DesktopViewModel(authManager: AuthManager()))
  }
}


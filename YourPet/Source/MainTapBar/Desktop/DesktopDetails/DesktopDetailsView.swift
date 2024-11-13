import SwiftUI

struct DesktopDetailsView: View {
  @EnvironmentObject var viewModel: DesktopDetailsViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
    }
    .navigationTitle(viewModel.navigationTitle)
  }
}

struct DesktopDetailsView_Previews: PreviewProvider {
  static var previews: some View { DesktopDetailsView()
      .environmentObject(DesktopDetailsViewModel(authManager: AuthManager()))
  }
}


import SwiftUI

struct QrCodeDetailsView: View {
  @EnvironmentObject var viewModel: QrCodeViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
    }
    .navigationTitle(viewModel.navigationTitle)
  }
}

struct QrCodeDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    QrCodeDetailsView()
      .environmentObject(QrCodeDetailsViewModel(authManager: AuthManager()))
  }
}


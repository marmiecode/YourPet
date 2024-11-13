import SwiftUI

struct QrCodeView: View {
  @EnvironmentObject var viewModel: QrCodeViewModel
  @State private var navDestination: NavigationDestination?
  
  var body: some View {
    VStack {
      Button("QR details") {
        navDestination = .qrCodeDetails(viewModel: viewModel.getQrCodeDetailsViewModel())
      }
    }
    .navigationTitle("Qr")
    .navigationListener($navDestination)
  }
}

struct QrCodeView_Previews: PreviewProvider {
  static var previews: some View {
    QrCodeView()
      .environmentObject(QrCodeViewModel(authManager: AuthManager()))
  }
}


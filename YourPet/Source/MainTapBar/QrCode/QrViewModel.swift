import Combine

final class QrCodeViewModel: ObservableObject {
  let title = "QR"
  let navigationTitle = "QR"
  private var qrCodeDetailsViewModel: QrCodeDetailsViewModel?
  private var authManager: AuthManager

  init(
    authManager: AuthManager,
    qrCodeDetailsViewModel: QrCodeDetailsViewModel? = nil
  ) {
    self.authManager = authManager
    self.qrCodeDetailsViewModel = qrCodeDetailsViewModel
  }
  
  func getQrCodeDetailsViewModel() -> QrCodeDetailsViewModel {
    guard let viewModel = qrCodeDetailsViewModel else {
      let newViewModel = QrCodeDetailsViewModel(authManager: authManager)
      self.qrCodeDetailsViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
}


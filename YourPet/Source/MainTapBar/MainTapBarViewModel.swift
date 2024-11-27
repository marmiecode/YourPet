import Combine

final class MainTabBarViewModel: ObservableObject {  
  let title = "Im a MainTabBar"
  let navigationTitle = "TABBAR"
  private var qrCodeViewModel: QrCodeViewModel?
  private var mapViewModel: MapViewModel?
  private var authManager: AuthManager
  
  init(
    authManager: AuthManager,
    qrCodeViewModel: QrCodeViewModel? = nil,
    mapViewModel: MapViewModel? = nil
  ) {
    self.authManager = authManager
    self.qrCodeViewModel = qrCodeViewModel
    self.mapViewModel = mapViewModel
  }
    
  func getQrCodeViewModel() -> QrCodeViewModel {
    guard let viewModel = qrCodeViewModel else {
      let newViewModel = QrCodeViewModel(authManager: authManager)
      self.qrCodeViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
  
  func getMapViewModel() -> MapViewModel {
    guard let viewModel = mapViewModel else {
      let newViewModel = MapViewModel(authManager: authManager)
      self.mapViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
  
  func signOut() {
    authManager.signOut { error in
    }
  }
}


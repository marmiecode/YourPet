import Combine

final class MainTabBarViewModel: ObservableObject {  
  let title = "Im a MainTabBar"
  let navigationTitle = "TABBAR"
  private var homeViewModel: HomeViewModel?
  private var desktopViewModel: DesktopViewModel?
  private var qrCodeViewModel: QrCodeViewModel?
  private var mapViewModel: MapViewModel?
  private var authManager: AuthManager
  
  init(
    authManager: AuthManager,
    homeViewModel: HomeViewModel,
    desktopViewModel: DesktopViewModel? = nil,
    qrCodeViewModel: QrCodeViewModel? = nil,
    mapViewModel: MapViewModel? = nil
  ) {
    self.authManager = authManager
    self.homeViewModel = homeViewModel 
    self.desktopViewModel = desktopViewModel
    self.qrCodeViewModel = qrCodeViewModel
    self.mapViewModel = mapViewModel
  }
  
  func getDesktopViewModel() -> DesktopViewModel {
    guard let viewModel = desktopViewModel else {
      let newViewModel = DesktopViewModel(authManager: authManager)
      self.desktopViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
  
  func getHomeViewModel() -> HomeViewModel {
    guard let viewModel = homeViewModel else {
      let newViewModel = HomeViewModel(authManager: authManager)
      self.homeViewModel = newViewModel
      return newViewModel
    }
    return viewModel
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


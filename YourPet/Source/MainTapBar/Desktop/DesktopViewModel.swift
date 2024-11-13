import Combine

final class DesktopViewModel: ObservableObject {
  let title = "Desktop"
  let navigationTitle = "Desktop"
  private var desktopDetailViewModel: DesktopDetailsViewModel?
  private var authManager: AuthManager
  
  init(
    authManager: AuthManager,
    profileDetailViewModel: DesktopDetailsViewModel? = nil
  ) {
    self.authManager = authManager
    self.desktopDetailViewModel = desktopDetailViewModel
  }
  
  func getDesktopDetailsViewModel() -> DesktopDetailsViewModel {
    guard let viewModel = desktopDetailViewModel else {
      let newViewModel = DesktopDetailsViewModel(authManager: authManager)
      self.desktopDetailViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
}


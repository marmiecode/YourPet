import Combine

final class HomeViewModel: ObservableObject {
  let title = "Home"
  let navigationTitle = "Home"
  private var homeDetailsViewModel: HomeDetailsViewModel?
  private var authManager: AuthManager

  init(
    authManager: AuthManager,
    homeDetailsViewModel: HomeDetailsViewModel? = nil
  ) {
    self.authManager = authManager
    self.homeDetailsViewModel = homeDetailsViewModel
  }
  
  func getHomeDetailsViewModel() -> HomeDetailsViewModel {
    guard let viewModel = homeDetailsViewModel else {
      let newViewModel = HomeDetailsViewModel(authManager: authManager)
      self.homeDetailsViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
}

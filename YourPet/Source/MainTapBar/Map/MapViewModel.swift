import Combine

final class MapViewModel: ObservableObject {
  let title = "Mapa"
  let navigationTitle = "Mapa"
  private var mapDetailViewModel: MapDetailsViewModel?
  private var authManager: AuthManager
  
  init(
    authManager: AuthManager,
    mapDetailViewModel: MapDetailsViewModel? = nil
  ) {
    self.authManager = authManager
    self.mapDetailViewModel = mapDetailViewModel
  }
  
  func getMapDetailsViewModel() -> MapDetailsViewModel {
    guard let viewModel = mapDetailViewModel else {
      let newViewModel = MapDetailsViewModel(authManager: authManager)
      self.mapDetailViewModel = newViewModel
      return newViewModel
    }
    return viewModel
  }
}

import Combine

final class MapDetailsViewModel: ObservableObject {
  let title = "Map VIEW DETAILS"
  let navigationTitle = "MapDetails DETAILS"
  private var authManager: AuthManager
  
  init(authManager: AuthManager) {
    self.authManager = authManager
  }
}

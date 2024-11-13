import Combine

final class DesktopDetailsViewModel: ObservableObject {
  let title = "Im a DESKTOP VIEW DETAILS"
  let navigationTitle = "DesktopDetails DETAILS"
  private var authManager: AuthManager

  init(authManager: AuthManager) {
    self.authManager = authManager
  }
}


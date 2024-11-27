import SwiftUI

class Router: ObservableObject {
  @Published var currentPath: [Route] = []
  
  enum Route: Hashable {
    case home
    case login
    case register
    case qrCode
    case map
    case qrCodeDetails
    case mapDetails
  }
  
  func navigate(to route: Route) {
    currentPath.append(route)
  }
  
  func pop() {
    currentPath.removeLast()
  }
}

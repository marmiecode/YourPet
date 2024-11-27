import SwiftUI

enum NavigationDestination: Hashable {
  case qrCodeDetails
  case mapDetails
  case register
  case home
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .qrCodeDetails:
      QrCodeDetailsView()
    case .mapDetails:
      MapDetailsView()
    case .register:
      RegisterView(authViewModel: AuthViewModel())
    case .home:
      HomeView()
    }
  }
}

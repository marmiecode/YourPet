import SwiftUI

enum NavigationDestination: Hashable {
  case login(viewModel: LoginViewModel)
  case register(viewModel: RegisterViewModel)
  case mainTabBar(viewModel: MainTabBarViewModel)
  case home(viewModel: HomeViewModel)
  case homeDetails(viewModel: HomeDetailsViewModel)
  case profile(viewModel: ProfileViewModel)
  case profileDetails(viewModel: ProfileDetailsViewModel)
  case map(viewModel: MapViewModel)
  case mapDetails(viewModel: MapDetailsViewModel)
  case none
  
  @ViewBuilder
  var buildNavDestinationView: some View {
    switch self {
    case let .login(viewModel):
      LoginView().environmentObject(viewModel)
    case let .register(viewModel):
      RegisterView().environmentObject(viewModel)
    case let .mainTabBar(viewModel):
      MainTabBarView().environmentObject(viewModel)
    case let .home(viewModel):
      HomeView().environmentObject(viewModel)
    case let .homeDetails(viewModel):
      HomeDetailsView().environmentObject(viewModel)
    case let .profile(viewModel):
      ProfileView().environmentObject(viewModel)
    case let .profileDetails(viewModel):
      ProfileDetailsView().environmentObject(viewModel)
    case let .map(viewModel):
      MapView().environmentObject(viewModel)
    case let .mapDetails(viewModel):
      MapDetailsView().environmentObject(viewModel)
    case .none:
      EmptyView()
    }
  }
}



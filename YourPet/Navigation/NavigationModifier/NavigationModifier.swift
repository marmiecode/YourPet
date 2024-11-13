import SwiftUI

enum NavigationDestination: Hashable {
  case login(viewModel: LoginViewModel)
  case register(viewModel: RegisterViewModel)
  case mainTabBar(viewModel: MainTabBarViewModel)
  case home(viewModel: HomeViewModel)
  case homeDetails(viewModel: HomeDetailsViewModel)
  case desktop(viewModel: DesktopViewModel)
  case desktopDetails(viewModel: DesktopDetailsViewModel)
  case qrCode(viewModel: QrCodeViewModel)
  case qrCodeDetails(viewModel: QrCodeDetailsViewModel)
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
    case let .homeDetails(viewModel: viewModel):
      HomeDetailsView().environmentObject(viewModel)
    case let .desktop(viewModel):
      DesktopView().environmentObject(viewModel)
    case let .desktopDetails(viewModel):
      DesktopDetailsView().environmentObject(viewModel)
    case let .qrCode(viewModel):
      QrCodeView().environmentObject(viewModel)
    case let .qrCodeDetails(viewModel):
      QrCodeDetailsView().environmentObject(viewModel)
    case let .map(viewModel):
      MapView().environmentObject(viewModel)
    case let .mapDetails(viewModel):
      MapDetailsView().environmentObject(viewModel)
    case .none:
      EmptyView()
    }
  }
}

struct NavigationModifier: ViewModifier {
  let navDestination: Binding<NavigationDestination?>
  
  private var navDestinationBinding: Binding<Bool> {
    Binding<Bool>(
      get: { navDestination.wrappedValue != nil },
      set: { newValue in
        if !newValue {
          navDestination.wrappedValue = nil
        }
      }
    )
  }
  
  func body(content: Content) -> some View {
    if #available(iOS 16.0, *) {
      content
        .navigationDestination(isPresented: navDestinationBinding) {
          navDestination.wrappedValue?.buildNavDestinationView
        }
    } else {
      content.background(EmptyView())
    }
  }
}

extension View {
  func navigationListener(_ navDestination: Binding<NavigationDestination?>) -> some View {
    modifier(NavigationModifier(navDestination: navDestination))
  }
}

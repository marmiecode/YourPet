import SwiftUI

struct MainTabBarView: View {
  @EnvironmentObject var router: Router
  @State private var selectedTab: Router.Route = .home
  
  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView()
        .tabItem {
          Label("Home", systemImage: "house.fill")
        }
        .tag(Router.Route.home)
      
      QrCodeView()
        .tabItem {
          Label("QR Code", systemImage: "qrcode")
        }
        .tag(Router.Route.qrCode)
      
      MapView()
        .tabItem {
          Label("Map", systemImage: "map.fill")
        }
        .tag(Router.Route.map)
    }
  }
}

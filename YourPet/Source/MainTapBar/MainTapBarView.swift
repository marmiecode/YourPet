import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var viewModel: MainTabBarViewModel
    @State private var selectedIndex: Int = 0
    @State private var navDestination: NavigationDestination?
    
    var body: some View {
        TabView(selection: $selectedIndex) {
          if #available(iOS 16.0, *) {
            NavigationStack {
              NavigationDestination
                .home(viewModel: viewModel.getHomeViewModel())
                .buildNavDestinationView
            }
            .tabItem {
              Text("Home view")
              Image(systemName: "house.fill")
                .renderingMode(.template)
            }
            .tag(0)
          } else {
            // Fallback on earlier versions
          }
            
          if #available(iOS 16.0, *) {
            NavigationStack {
              NavigationDestination
                .desktop(viewModel: viewModel.getDesktopViewModel())
                .buildNavDestinationView
            }
            .tabItem {
              Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
          } else {
            // Fallback on earlier versions
          }
            
          if #available(iOS 16.0, *) {
            NavigationStack {
              NavigationDestination
                .map(viewModel: viewModel.getMapViewModel())
                .buildNavDestinationView
            }
            .tabItem {
              Label("Mapa", systemImage: "map.fill")
            }
            .tag(2)
          } else {
            // Fallback on earlier versions
          }
            
          if #available(iOS 16.0, *) {
            NavigationStack {
              Text("Qr Code")
                .navigationTitle("Qr Code")
            }
            .tabItem {
              Text("Qr Code")
              Image(systemName: "info.circle")
            }
            .tag(3)
          } else {
            // Fallback on earlier versions
          }
        }
        .navigationBarBackButtonHidden(true)
        .tint(.pink)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .systemBrown
            UITabBarItem.appearance().badgeColor = .systemPink
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .environmentObject(MainTabBarViewModel(authManager: AuthManager()))
    }
}


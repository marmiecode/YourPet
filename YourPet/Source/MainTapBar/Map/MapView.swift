import SwiftUI

struct MapView: View {
  @EnvironmentObject var viewModel: MapViewModel
  @State private var navDestination: NavigationDestination?
  
  var body: some View {
    VStack {
      Button("Mapa") {
        navDestination = .mapDetails(viewModel: viewModel.getMapDetailsViewModel())
      }
    }
    .navigationTitle("Mapa")
    .navigationListener($navDestination)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
      .environmentObject(MapViewModel(authManager: AuthManager()))
  }
}


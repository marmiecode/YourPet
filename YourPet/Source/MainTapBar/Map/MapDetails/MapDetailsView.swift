import SwiftUI

struct MapDetailsView: View {
  @EnvironmentObject var viewModel: MapDetailsViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
    }
    .navigationTitle(viewModel.navigationTitle)
  }
}

struct MapDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    MapDetailsView()
      .environmentObject(MapDetailsViewModel(authManager: AuthManager()))
  }
}


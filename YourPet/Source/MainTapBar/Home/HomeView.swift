import SwiftUI

struct HomeView: View {
  @EnvironmentObject var router: Router
  @EnvironmentObject var viewModel: HomeViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
      Button("Przejdź do QR") {
        router.navigate(to: .qrCode)
      }
      Button("Przejdź do Mapy") {
        router.navigate(to: .map)
      }
    }
    .navigationTitle(viewModel.navigationTitle)
  }
}

#Preview {
  HomeView()
}

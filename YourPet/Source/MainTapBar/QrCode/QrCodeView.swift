import SwiftUI

struct QrCodeView: View {
  @EnvironmentObject var router: Router
  @EnvironmentObject var authViewModel: AuthViewModel
  
  var body: some View {
    VStack {
      Button("Przejdź do QR Details") {
        router.navigate(to: .qrCodeDetails)
      }
    }
    .navigationTitle("QR")
  }
}

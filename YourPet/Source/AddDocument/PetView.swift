import SwiftUI

struct PetListView: View {
  @StateObject private var viewModel = PetViewModel()
  
  var body: some View {
    NavigationView {
      List(viewModel.pets) { pet in
        VStack(alignment: .leading) {
          Text("Name: \(pet.name)")
          Text("Breed: \(pet.breed)")
          Text("Gender: \(pet.gender)")
        }
      }
      .navigationTitle("Your Pets")
      .onAppear {
        Task {
          await viewModel.fetchPetsForCurrentUser()
        }
      }
      .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
        Button("OK", role: .cancel) {}
      } message: {
        Text(viewModel.errorMessage ?? "Unknown error")
      }
    }
  }
}

import Foundation

@MainActor
class PetViewModel: ObservableObject {
  @Published var pets: [Pet] = []
  @Published var errorMessage: String?
  @Published var isLoading = false
  
  private let firestoreService = FirestoreService()
  private let authService = FirebaseAuthService.shared
  
  func fetchPetsForCurrentUser() async {
    guard let userId = authService.currentUserId() else {
      errorMessage = "User not logged in"
      return
    }
    
    isLoading = true
    defer { isLoading = false }
    
    do {
      pets = try await firestoreService.fetchPets(for: userId)
    } catch {
      errorMessage = "Failed to fetch pets: \(error.localizedDescription)"
    }
  }
  
  func addPet(_ pet: Pet) async {
    guard let userId = authService.currentUserId() else {
      errorMessage = "User not logged in"
      return
    }
    
    isLoading = true
    defer { isLoading = false }
    
    do {
      try await firestoreService.addPet(for: userId, pet: pet)
      await fetchPetsForCurrentUser() 
    } catch {
      errorMessage = "Failed to add pet: \(error.localizedDescription)"
    }
  }
}

import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirestoreService {
  private let db = Firestore.firestore()
  
  // Dodanie psa do użytkownika
  func addPet(for userId: String, pet: Pet) async throws {
    let petsCollection = db.collection("users").document(userId).collection("pets")
    try await petsCollection.addDocument(from: pet)
  }
  
  // Pobranie wszystkich psów użytkownika
  func fetchPets(for userId: String) async throws -> [Pet] {
    let petsCollection = db.collection("users").document(userId).collection("pets")
    let snapshot = try await petsCollection.getDocuments()
    return snapshot.documents.compactMap { try? $0.data(as: Pet.self) }
  }
}

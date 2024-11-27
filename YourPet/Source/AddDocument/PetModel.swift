import Foundation
import FirebaseFirestoreSwift

struct Pet: Codable, Identifiable {
  @DocumentID var id: String?
  let name: String
  let vaccinationDate: Date
  let birthDate: Date
  let chipNumber: String
  let gender: String
  let animalType: String
  let breed: String
  let visitHistory: String
  
  var age: Int { 
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.year], from: birthDate, to: now)
    return components.year ?? 0
  }
}

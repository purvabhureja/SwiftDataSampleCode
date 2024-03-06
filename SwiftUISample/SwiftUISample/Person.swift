//Created by Purva Bhureja

import SwiftUI
import SwiftData


// Codable for Person
public struct Person: Codable {
  public var name: String?
  public var info: Info?
}

// Codable for Info
public struct Info: Codable {
  public var title: String?
  public var age: Int?
  public var phone: String?
  public var email: String?
}

//view model to handle the data and provide the necessary functionality:


class ViewModel: ObservableObject {
    @Published var people: [Person] = []
    @Published var selectedPerson: Person?
    
    init() {
        // Load data from JSON using Codable
         people: = self.loadJson("data.json") as [Person] 
    }
    
    func selectPerson(_ person: Person) {
        self.selectedPerson = person
    }
    
    func validateFields() -> Bool {
        guard let selectedPerson = selectedPerson else { return false }
        return !selectedPerson.name.isEmpty && !selectedPerson.info.email.isEmpty
    }
    
    func saveData() {
        // Save data using SwiftData
        do {
            try SwiftData.save(data: people, to: "people.json")
        } catch {
            print("Error saving data: \(error)")
        }
    }
}

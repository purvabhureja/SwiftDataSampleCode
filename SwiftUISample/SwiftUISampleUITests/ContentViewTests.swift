import XCTest
@testable import SwiftUISample

class ContentViewTests: XCTestCase {
    func testSelectPerson() {
        let contentView = ContentView()
        
        // Simulate selecting a person
        contentView.selectedPerson = Person(name: "Tara McKenzie", info: Info(title: "Dr.", age: 42, phone: "(674) 936-7086 x45855", email: "skoch@gmail.com"))
        
        // Verify that the selected person's details are displayed
        XCTAssertEqual(contentView.body, AnyView(Text("Name: Tara McKenzie")))
    }
}

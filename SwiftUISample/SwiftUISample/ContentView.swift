// Created by Purva Bhureja

import SwiftUI

//combines the side bar menu and the main view
struct ContentView: View {

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            SideBarMenuView()
            
            MainView()
        }
        .navigationTitle("Side Bar Menu")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if viewModel.validateFields() {
                        viewModel.saveData()
                    } else {
                        // Handle error or exception
                        print("Name or email is blank")
                    }
                }) {
                    Text("Save")
                }
            }
        }
    }
}


//main view to display the selected person's details:
struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if let selectedPerson = viewModel.selectedPerson {
                Text(selectedPerson.name)
                Text(selectedPerson.info.title)
                Text("\(selectedPerson.info.age)")
                Text(selectedPerson.info.phone)
                Text(selectedPerson.info.email)
            } else {
                Text("No person selected")
            }
        }
    }
}


//Side bar menu

struct SideBarMenuView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.people, id: \.name) { person in
            Button(action: {
                viewModel.selectPerson(person)
            }) {
                Text(person.name)
            }
        }
        .listStyle(SidebarListStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

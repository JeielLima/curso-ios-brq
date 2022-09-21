import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("Add"){
                ViewModel().createProfessor(nome: "Jeiel", email: "jeiel@ios.com")
            }
            
            Button("Update"){
                ViewModel().updateProfessores(id: 646, nome: "Jeiel ASUEHAS", email: "jeiel@ouarg.com")
            }
            
            Button("Delete"){
                ViewModel().deleteProfessores(id: 646)
            }
            Button("Stress Button"){
                ViewModel().fetchProfessores()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

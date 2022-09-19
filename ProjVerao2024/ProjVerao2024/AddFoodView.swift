import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    
    var body: some View {
        
        Form {
            Section{
                TextField("Food Name", text: $name )
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                HStack{
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, context: managedObjectContext )
                    }
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}

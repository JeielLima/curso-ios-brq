import SwiftUI

struct AddProfessoresView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome : String = ""
    @State var email : String = ""
    
    var body: some View {
        
        Form{
            Section {
                
                VStack{
                    Text("Nome")
                    TextField("Nome", text: $nome)
                } // VStack
                
                Spacer()
                
                VStack{
                    Text("Email")
                    TextField("Email", text: $email)
                } // VStack
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button("Salvar"){
                        
                        viewModel.createProfessor(nome: nome, email: email)
                        
                        // para fechar o modal
                        dismiss()
                    } // Button
                }//HStack
                

            } // Section
        } // Form
    } // body
} // struct
struct AddProfessoresView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfessoresView()
    }
}

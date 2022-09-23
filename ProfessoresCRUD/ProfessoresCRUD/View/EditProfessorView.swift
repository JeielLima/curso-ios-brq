//
//  EditProfessorView.swift
//  ProfessoresCRUD
//
//  Created by Jeiel Lima on 23/09/22.
//

import SwiftUI

struct EditProfessorView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome : String = ""
    @State var email : String = ""
    
    // vai receber o objeto a ser alterado
    @State var professor : ProfessorModel
    
    var body: some View {
        
        Form{
            Section {
                
                VStack(alignment: .leading){
                    Spacer()
                    
                    TextFormView(text : "Nome" )
                        
                    TextField("Nome", text: $nome)
                }.padding() // VStack
                
              
                
                VStack(alignment: .leading){
                    Spacer()
                    //Text("Email")
                    TextFormView(text : "Email" )
                    TextField("Email", text: $email)
                }.padding() // VStack
                
                //Spacer()
                
                VStack{
                    HStack{
                        Button(action: {
                            
                            viewModel.updateProfessores(id: professor.id, nome: nome, email: email)
                            
                            // para fechar o modal
                            dismiss()
                        }, label: {
                            ButtonFormView(text: "Editar")
                        })// Button
                    }//HStack
                } //VStack
                .onAppear(perform: {
                    self.nome = professor.nome
                    self.email = professor.email
                })

            } // Section
        } // Form
    }
}

//struct EditProfessorView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfessorView()
//    }
//}

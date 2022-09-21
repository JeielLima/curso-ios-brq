//
//  ViewModel.swift
//  ProfessoresCRUD
//
//  Created by Jeiel Lima on 21/09/22.
//

import Foundation

// responsável por pegar os objetos
class ViewModel {
    
    var items: [ProfessorModel] = []
    let urlAddr: String = "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores"
    
    func fetchProfessores() {
      
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores") else {
            print ("URL NOT FOUND")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error \(error!)")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([ProfessorModel].self, from: data)
                    self.items = result
                }
            } catch {
                print("Fetch-Error")
            }
        } .resume()         // o resume é necessário para executar a task

    }
    
    func createProfessor(nome: String, email: String) {
        
        guard let url = URL(string: urlAddr) else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let professor: ProfessorModel = ProfessorModel(id: 0, nome: nome, email: email)
        do {
            request.httpBody = try JSONEncoder().encode(professor)
        } catch {
            print("Erro ao converter o professor")
        }
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            
            if error != nil {
                print("error \(error!)")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(ProfessorModel.self, from: data)
                }
            } catch {
                print("Erro ao converter o professor")
            }
        } .resume()
    }
    
    func updateProfessores(id : Int, nome : String, email: String){
            
        guard let url = URL(string: "\(urlAddr)/\(id)") else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let professor : ProfessorModel = ProfessorModel(id:id, nome:nome, email:email)
        
        do {
            request.httpBody = try JSONEncoder().encode(professor)
        }
        catch {
            print("Erro ao converter o professor")
        }

        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            }
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(ProfessorModel.self, from: data)
                }
            } catch {
                print("Erro ao converter o professor")
            }
        }.resume()
    }
    
    func deleteProfessores(id : Int){
        
        guard let url = URL(string: "\(urlAddr)/\(id)") else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            }
        }.resume()
    }
    
    func stressFunction(){
        
        for i in 1...1000{
            createProfessor(nome: "Professor \(i)", email: "Email \(i)")
        }
    }
}

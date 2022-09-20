//
//  DataModel.swift
//  ProjCRUD
//
//  Created by Jeiel Lima on 20/09/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController : ObservableObject {
    
    let container = NSPersistentContainer(name: "DataModel")
    
    init(){
        container.loadPersistentStores  { description, error in
            if let errorIfLet = error{
                print("Erro ao carregar os dados: \(errorIfLet)")
            }
        }
    }

    func save(context: NSManagedObjectContext){
        do {
            try context.save()
        }
        catch {
            print("Erro ao salvar os dados: \(error)")
        }
    }

    func addUser(name: String, lastname: String, email: String, password: String ,context : NSManagedObjectContext){
        
        let user = User(context: context)
        
        user.name = name
        user.lastname = lastname
        user.email = email
        user.password = password
        
        save(context: context)
    }
    

    func editUser(userOld: User, name: String, lastname: String, email: String, password: String, register_date: Date, context: NSManagedObjectContext){
        
        userOld.name = name
        userOld.lastname = lastname
        userOld.email = email
        userOld.password = password
        userOld.register_date = Date()
        
        save(context: context)
    }

    func deleteUser(offsets: IndexSet, context: NSManagedObjectContext, user: FetchedResults<User>){

        offsets.map { user[$0] }
            .forEach (context.delete )
        
        save(context: context)
    }
}

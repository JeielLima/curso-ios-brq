/* Uma classe que vai agrupar as funções que vão permitir manipular os dados:
- save(): permite salvar os dados do CoreData;
- update(): permite alterar os dados no banco de dados do CoreData.
 
 * CRUD: Create, Read(ler tudo ou apenas um registro), Update, Delete.
 
 * Um contexto no CoreData está relacionado a quais entidades o mesmo pode gerenciar: fazer CRUD das mesmas.
 
 * Try e Catch: é mecanismo que permite tentar fazer algo com possibilidade de tratarmos este erro sem que o aplicativo pare.
 
 *
 
*/

import Foundation
import CoreData
import SwiftUI

class DataController : ObservableObject {
    
    /*
     NSPersistentContainer ajuda a gerenciar os objetos que serão
     salvos no Core Data.
     **/
    let container = NSPersistentContainer(name: "FoodModel")
    
    init(){
        /**
            Quando inicializa-se o container (NSPersistentContainer), é necessário carregar os objetos do Core Data para  poder ser manipulados
         */
        container.loadPersistentStores  { description, error in
            if let errorIfLet = error{
                print("Erro ao carregar os dados \(errorIfLet)")
            }
            
        }
    }

    func save(context: NSManagedObjectContext){
        do{
            // try - catch
            try context.save()
        }
        catch {
            //let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    
    /**
            UUID , name, date, calories
     */
    func addFood(name: String, calories: Double, context : NSManagedObjectContext){
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
        
        save(context: context)
    }
    

    func editFood(foodOld: Food, name: String, calories: Double, context: NSManagedObjectContext){
        
        foodOld.name = name
        foodOld.calories = calories
        foodOld.date = Date()
        
        save(context: context)
    }
    
    /**
     IndexSet são os índices dos elementos que precisamos deletar
     */
    func deleteFood(offsets: IndexSet, context: NSManagedObjectContext, food: FetchedResults<Food>){
     
        // para cada elemento que queremos deletar, temos que atuliar o contexto com esta operação
        // offsets é uma lista
        // $0 -> para pegar o primeiro elemento que vem na função
        // (arg1, arg2, arg3)
        // ($0   , $1 , $2)
        
        // para cada elemendo do offset, eu acho o mesmo no array food e delete do contexto
        offsets.map{ food[$0] }
            .forEach( context.delete )
        
        save(context: context)
    }
    
}

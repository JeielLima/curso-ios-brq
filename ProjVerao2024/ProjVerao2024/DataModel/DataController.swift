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


class DataController {
    
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { (description, error) in
            if let errorIfLet = error {
                print("Erro ao carregar os dados \(errorIfLet)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
        }
        catch {
            print("Erro ao salvar os dados do contexto \(error)")
        }
    }

    func update() {
        
    }

    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
       
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
        
        //Criar função salvar no context
    }
    
    func editFood(foodOld: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        
        foodOld.name = name
        foodOld.calories =  calories
        foodOld.date = Date()
        
        save(context: context)
    }
}

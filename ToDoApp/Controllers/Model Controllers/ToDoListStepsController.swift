//
//  ToDoListStepsController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import Foundation

class ToDoListStepsController: Codable {
    
//MARK: - Properties
    
    static let sharedInstance = ToDoListStepsController()
    
    var tasks: [ToDoListSteps] = []
    
     func createStep(step: String, toDo: [ToDoList]) {
        let toDoListStep = ToDoListSteps(step: step)
        tasks.append(toDoListStep)
    }
    
     func deleteStep(step: ToDoListSteps, toDo: ToDoList) {
       guard let index = toDo.numberOfSteps.firstIndex(of: step) else {return}
        tasks.remove(at: index)
    }
    
     func toggleIsDone(step: ToDoListSteps) {
        step.isDone.toggle()
    }
    
    
    func deleteAllTasks() {
        tasks.forEach({$0.deleteAll = true})
    }
}

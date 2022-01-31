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
//        ToDoListController.sharedInstance.saveToDoToDisk()
    }
    
     func deleteStep(step: ToDoListSteps, in toDo: ToDoList) {
        guard let index = toDo.numberOfSteps.firstIndex(of: step) else {return}
        tasks.remove(at: index)
//        ToDoListController.sharedInstance.saveToDoToDisk()
    }
    
     func toggleIsDone(step: ToDoListSteps) {
        step.isDone.toggle()
//        ToDoListController.sharedInstance.saveToDoToDisk()
    }
}

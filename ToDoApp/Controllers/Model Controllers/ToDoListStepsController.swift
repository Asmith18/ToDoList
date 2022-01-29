//
//  ToDoListStepsController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import Foundation

class ToDoListStepsController: Codable {
    
    static func createStep(step: String, toDo: ToDoList) {
        let toDoListStep = ToDoListSteps(step: step)
        toDo.numberOfSteps.append(toDoListStep)
        ToDoListController.sharedInstance.saveToDoToDisk()
    }
    
    static func deleteStep(step: ToDoListSteps, in toDo: ToDoList) {
        guard let index = toDo.numberOfSteps.firstIndex(of: step) else {return}
        toDo.numberOfSteps.remove(at: index)
        ToDoListController.sharedInstance.saveToDoToDisk()
    }
    
    static func toggleIsDone(step: ToDoListSteps) {
        step.isDone.toggle()
        ToDoListController.sharedInstance.saveToDoToDisk()
    }
}

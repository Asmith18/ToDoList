//
//  ToDoListController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import Foundation

class ToDoListController {
    //MARK: - Properties
    static let sharedInstance = ToDoListController()
    
    var toDos: [ToDoList] = []
    
    //MARK: - CRUD
    func createToDo(task: String, numberOfSteps: [ToDoListSteps] = []) {
        let toDo = ToDoList(task: task, numberOfSteps: numberOfSteps)
        toDos.append(toDo)
    }
    
    func deleteToDo(toDo: ToDoList) {
        guard let index = toDos.firstIndex(of: toDo) else {return}
        toDos.remove(at: index)
    }
    
    func toggleisChecked(for tasks: ToDoList) {
        tasks.isChecked.toggle()
    }
    
    
    
}

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
    
//MARK: - Initializer
    init() {
       // loadToDoFromDisk()
    }
    
    
//MARK: - CRUD
    func createToDo(task: String, numberOfSteps: [ToDoListSteps] = []) {
        let toDo = ToDoList(task: task, numberOfSteps: numberOfSteps)
        toDos.append(toDo)
      //  saveToDoToDisk()
    }
    
    func updateToDo(toDo: ToDoList, task: String, isChecked: Bool = Bool()) {
        toDo.task = task
      //  saveToDoToDisk()
    }
    
    func deleteToDo(toDo: ToDoList) {
        guard let index = toDos.firstIndex(of: toDo) else {return}
        toDos.remove(at: index)
       // saveToDoToDisk()
    }
    
    func toggleisChecked(for tasks: ToDoList) {
        tasks.isChecked.toggle()
       // ToDoListController.sharedInstance.saveToDoToDisk()
    }
    
    
//MARK: - Persistance
//   func saveToDoToDisk() {
//       guard let url = fileURL else {return}
//       do {
//           let data = try JSONEncoder().encode(toDos)
//           try data.write(to: url)
//       } catch let error {
//           print(error)
//       }
//    }
//
//    func loadToDoFromDisk() {
//        guard let url = fileURL else {return}
//        do {
//            let data = try Data(contentsOf: url)
//            let categories = try JSONDecoder().decode([ToDoList].self, from: data)
//            self.toDos = categories
//        } catch let error {
//            print(error)
//        }
//    }
//
//    private var fileURL: URL? {
//        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
//        let url = documentDirectory.appendingPathComponent("todo.json")
//        return url
//    }
}

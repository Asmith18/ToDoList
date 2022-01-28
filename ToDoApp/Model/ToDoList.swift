//
//  ToDoList.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import Foundation

class ToDoList: Codable {
    
    var task: String
    var isChecked: Bool
    let id: UUID
    var numberOfSteps: String
    
    init(id: UUID = UUID(), task: String, isChecked: Bool = false, numberOfSteps: String) {
        self.id = id
        self.task = task
        self.isChecked = isChecked
        self.numberOfSteps = numberOfSteps
    }
}

extension ToDoList: Equatable {
    static func == (lhs: ToDoList, rhs: ToDoList) -> Bool {
        return lhs.id == rhs.id
    }
}

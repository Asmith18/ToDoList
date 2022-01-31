//
//  ToDoListSteps.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import Foundation

class ToDoListSteps: Codable {
    
    var step: String
    var isDone: Bool
    let id: UUID
    var deleteAll: Bool
    
    init(id: UUID = UUID(), step: String, isDone: Bool = false, deleteAll: Bool = false) {
        self.id = id
        self.step = step
        self.isDone = isDone
        self.deleteAll = deleteAll
    }
}

extension ToDoListSteps: Equatable {
    static func == (lhs: ToDoListSteps, rhs: ToDoListSteps) -> Bool {
        return lhs.id == rhs.id
    }
}

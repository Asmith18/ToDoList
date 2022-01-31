//
//  ToDoListStepsTableViewController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import UIKit

class ToDoListStepsTableViewController: UITableViewController {
    
//MARK: - Outlets
    @IBOutlet weak var toDoListStepNameTextField: UITextField!
    
    var task: ToDoListSteps?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoListStepsController.sharedInstance.tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "StepsCell", for: indexPath) as? ToDoListStepsTableViewCell else { return UITableViewCell() }
        let task = ToDoListStepsController.sharedInstance.tasks[indexPath.row]
        cell.delegate = self
        cell.updateViews(task: task)
        

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let step = toDoListStepNameTextField.text else {return}
        let numberOfSteps: [ToDoList] = []
        ToDoListStepsController.sharedInstance.createStep(step: step, toDo: numberOfSteps)
        tableView.reloadData()
    }
}

extension ToDoListStepsTableViewController: ToDoListStepsTableViewCellDelegate {
    func isDoneToggled(cell: ToDoListStepsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let toggle = ToDoListStepsController.sharedInstance.tasks[indexPath.row]
        ToDoListStepsController.sharedInstance.toggleIsDone(step: toggle)
        cell.updateViews(task: toggle)
    }
}

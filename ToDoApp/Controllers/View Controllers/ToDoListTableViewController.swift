//
//  ToDoListTableViewController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

import UIKit

class ToDoListTableViewController: UITableViewController {


    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    var toDo: ToDoList?

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoListController.sharedInstance.toDos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath) as? ToDoListTableViewCell else { return UITableViewCell() }
        let toDo = ToDoListController.sharedInstance.toDos[indexPath.row]
        cell.delegate = self
        cell.updateViews(toDo: toDo)
        
        

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
    @IBAction func createButton(_ sender: Any) {
        guard let task = taskNameTextField.text else {return}
        ToDoListController.sharedInstance.createToDo(task: task)
        tableView.reloadData()
    }
    
    /*
    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    */
}

extension ToDoListTableViewController: ToDoListTableViewCellDelegate {
    func isCheckedToggled(cell: ToDoListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let toggle = ToDoListController.sharedInstance.toDos[indexPath.row]
        ToDoListController.sharedInstance.toggleisChecked(for: toggle)
        cell.updateViews(toDo: toggle)
    }
}

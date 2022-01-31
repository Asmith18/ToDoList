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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(deleteAllTasks), name: nil, object: nil)
    }

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
    
//   @objc func deleteAllTasks() {
//        ToDoListStepsController.sharedInstance.deleteAllTasks()
//        tableView.reloadData()
//    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let step = toDoListStepNameTextField.text else {return}
        let numberOfSteps: [ToDoList] = []
        ToDoListStepsController.sharedInstance.createStep(step: step, toDo: numberOfSteps)
        tableView.reloadData()
    }
    
//    private func presentAllIsCompleteAlert() {
//        let alertController = UIAlertController(title: "Complete", message: "All Task's have Been Completed", preferredStyle: .alert)
//        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
//        alertController.addAction(deleteAction)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.tableView.reloadData()
//        
//        alertController.addAction(deleteAction)
//        present(alertController, animated: true)
//    }
}

extension ToDoListStepsTableViewController: ToDoListStepsTableViewCellDelegate {
    func isDoneToggled(cell: ToDoListStepsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let toggle = ToDoListStepsController.sharedInstance.tasks[indexPath.row]
        ToDoListStepsController.sharedInstance.toggleIsDone(step: toggle)
        cell.updateViews(task: toggle)
    }
}

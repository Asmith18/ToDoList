//
//  ToDoListStepsTableViewController.swift
//  ToDoApp
//
//  Created by adam smith on 1/28/22.
//

// step 1 check off all steps in tasks.
// step 2 alert pop up saying all steps arew complete.
// step 3 delete task using the alert notification.

import UIKit

class ToDoListStepsTableViewController: UITableViewController {
    
//MARK: - Outlets
    @IBOutlet weak var toDoListStepNameTextField: UITextField!
    
    var toDo: ToDoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(deleteAllTasks), name: markAllisCompleted, object: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDo?.numberOfSteps.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "StepsCell", for: indexPath) as? ToDoListStepsTableViewCell, let toDo = toDo else { return UITableViewCell() }
        
        let task = toDo.numberOfSteps[indexPath.row]
        cell.delegate = self
        cell.updateViews(task: task)
        

        return cell
    }
    
   @objc func deleteAllTasks() {
       guard let toDo = toDo else { return }
       ToDoListController.sharedInstance.deleteToDo(toDo: toDo)
       self.tableView.reloadData()
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let removeFromtoDo = toDo else { return }
            let stepToDelete = removeFromtoDo.numberOfSteps[indexPath.row]
            ToDoListStepsController.sharedInstance.deleteStep(step: stepToDelete, toDo: removeFromtoDo)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let step = toDoListStepNameTextField.text, let toDo = toDo else {return}
        ToDoListStepsController.sharedInstance.createStep(step: step, toDo: toDo)
        tableView.reloadData()
    }
    
    private func presentAllIsCompleteAlert() {
        let alertController = UIAlertController(title: "All Done!", message: "Do you want to delete all steps?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
            self.deleteAllTasks()
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

extension ToDoListStepsTableViewController: ToDoListStepsTableViewCellDelegate {
    func isDoneToggled(cell: ToDoListStepsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
        let toDo = toDo else {return}
        let toggle = toDo.numberOfSteps[indexPath.row]
        ToDoListStepsController.sharedInstance.toggleIsDone(step: toggle)
        cell.updateViews(task: toggle)
        var steps = 0
        for step in toDo.numberOfSteps {
            if step.isDone {
                steps += 1
            }
        }
        let allStepsComplete = toDo.numberOfSteps.count
        if steps == allStepsComplete {
            presentAllIsCompleteAlert()
        }
    }
}

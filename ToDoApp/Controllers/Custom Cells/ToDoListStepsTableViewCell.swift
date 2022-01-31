//
//  ToDoListStepsTableViewCell.swift
//  ToDoApp
//
//  Created by adam smith on 1/30/22.
//

import UIKit

protocol ToDoListStepsTableViewCellDelegate: AnyObject {
    func isDoneToggled(cell: ToDoListStepsTableViewCell)
}

class ToDoListStepsTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var stepNameTextLabel: UILabel!
    @IBOutlet weak var isDoneButton: UIButton!
    
    
    weak var delegate: ToDoListStepsTableViewCellDelegate?
    
    
    func updateViews(task: ToDoListSteps) {
        stepNameTextLabel.text = task.step
        let favoriteImageName = task.isDone ? "checkmark.square.fill" : "checkmark.square"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        isDoneButton.setImage(favoriteImage, for: .normal)
    }
    
//MARK: - Actions
    @IBAction func toggleIsDoneButton(_ sender: Any) {
        delegate?.isDoneToggled(cell: self)
    }
}

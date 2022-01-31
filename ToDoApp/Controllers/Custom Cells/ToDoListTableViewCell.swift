//
//  ToDoListTableViewCell.swift
//  ToDoApp
//
//  Created by adam smith on 1/29/22.
//

import UIKit

protocol ToDoListTableViewCellDelegate: AnyObject {
    func isCheckedToggled(cell: ToDoListTableViewCell)
}


class ToDoListTableViewCell: UITableViewCell {
//MARK: - Outlets
    @IBOutlet weak var toDoListNameTextLabel: UILabel!
    @IBOutlet weak var numberOfStepsTextLabel: UILabel!
    @IBOutlet weak var checkedButton: UIButton!
    
    
    
    weak var delegate:ToDoListTableViewCellDelegate?
    
    
    func updateViews(toDo: ToDoList) {
        toDoListNameTextLabel.text = toDo.task
        numberOfStepsTextLabel.text = "# \(toDo.numberOfSteps)"
        let favoriteImageName = toDo.isChecked ? "checkmark.diamond.fill" : "checkmark.diamond"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        checkedButton.setImage(favoriteImage, for: .normal)
        
    }
    
//MARK: - Actions

    @IBAction func toggleCheckedButtonTapped(_ sender: Any) {
        delegate?.isCheckedToggled(cell: self)
    }
}



//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Matt Walter on 9/21/16.
//  Copyright © 2016 Matt Walter. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBAction func completeTapped(_ sender: AnyObject) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    @IBOutlet weak var taskLabel: UILabel!
    
    
    var task = Task()
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important {
            taskLabel.text = "❗️\(task.name)"
            
        } else {
            taskLabel.text = task.name
        }
        
}

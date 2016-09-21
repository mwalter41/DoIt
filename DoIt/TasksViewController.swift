//
//  TasksViewController.swift
//  DoIt
//
//  Created by Matt Walter on 9/20/16.
//  Copyright © 2016 Matt Walter. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[(indexPath as NSIndexPath).row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
            
        } else {
            cell.textLabel?.text = task.name
            
        }
        
        return cell
        
        
        }
        
    }
tableView(UITableView, didSelectRowAtIndexPath: indexPath) {
    let task = tasks[indexPath.row]
    
    selectedIndex = indexPath.row
    
    performSegueWithIdentifier(selectTaskSegue, sender: task)


    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the Dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the Lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegueWithIdentifier("addSegue", sender: nil)
    }
    
    override func prepareForSegue(_ segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destinationViewController as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
        let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
}

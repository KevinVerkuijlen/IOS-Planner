//
//  TaskDetailsViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {

    var task: Task?
    
    @IBOutlet var taskDetailsTitel: UITextField!
    @IBOutlet var taskDetailsNotes: UITextView!
    @IBOutlet var TaskCompletedSwitch: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDetailsTitel.text = task?.titel
        taskDetailsNotes.text = task?.notes
        TaskCompletedSwitch.on = (task?.completed)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TaskRemoveButton(sender: AnyObject) {
        if(task != nil){
            self.performSegueWithIdentifier("RemoveDetailToTask", sender: self)
        }
        
    }

    @IBAction func TaskChangeButton(sender: AnyObject) {
        if(taskDetailsTitel.text != nil && taskDetailsNotes.text != nil){
            self.performSegueWithIdentifier("ChangeDetailToTask", sender: self)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(taskDetailsTitel.text != nil && taskDetailsNotes.text != nil)
        {
            let newTask = Task(Titel: taskDetailsTitel.text!, Notes: taskDetailsNotes.text, Completed: TaskCompletedSwitch.on)
            if segue.identifier == "ChangeDetailToTask" {
                if let destination = segue.destinationViewController as? TaskController {
                    destination.taskAdministration.ChangeTask(task!, newTask: newTask)
                }
            }
            if segue.identifier == "RemoveDetailToTask" {
                if let destination = segue.destinationViewController as? TaskController {
                    destination.taskAdministration.RemoveTask(task!)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

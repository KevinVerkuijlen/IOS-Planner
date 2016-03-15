//
//  TaskAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {

    var newTask = Task(Titel: "", Notes: "")
    
    @IBOutlet var TaskAddTitelText: UITextField!
    @IBOutlet var TaskAddNotesText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskButton(sender: AnyObject) {
        if(TaskAddTitelText.text != "" && TaskAddNotesText.text != "")
        {
            self.performSegueWithIdentifier("NewTaskToTask", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(TaskAddTitelText.text != nil && TaskAddNotesText.text != nil)
        {
            newTask = Task(Titel: TaskAddTitelText.text!, Notes: TaskAddNotesText.text!)
            if segue.identifier == "NewTaskToTask" {
                if let destination = segue.destinationViewController as? TaskController{
                    destination.taskAdministration.AddTask(newTask)
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

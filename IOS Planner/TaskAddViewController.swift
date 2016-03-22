//
//  TaskAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit
import EventKit

class TaskAddViewController: UIViewController {

    var newTask = Task(Titel: "", Notes: "", AccountEmail: "")
    var taskAdministration: TaskAdministration?
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
        if(TaskAddTitelText.text != nil && TaskAddNotesText.text != nil)
        {
            newTask = Task(Titel: TaskAddTitelText.text!, Notes: TaskAddNotesText.text!, AccountEmail: "")
            var check = 0
            do{
                check = try taskAdministration!.CheckForTask(newTask)
            }
            catch TaskError.NoTaskValues{
                errorMessage("This task doesn't contain any values")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check == -1)
            {
                self.performSegueWithIdentifier("NewTaskToTask", sender: self)
            }
            else{
                errorMessage("This task already exist")
            }
        }
    }
    
    
    @IBAction func CancelAddTaskButton(sender: AnyObject) {
        self.performSegueWithIdentifier("CancelAddTask", sender: self)
    }
    
    func errorMessage(error: String){
        let alertController = UIAlertController(title: "Error", message:
            error, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }


   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(TaskAddTitelText.text != nil && TaskAddNotesText.text != nil)
        {
            if segue.identifier == "NewTaskToTask" {
                if let destination = segue.destinationViewController as? TaskController{
                    
                    do{
                     try taskAdministration!.AddTask(newTask)
                    }
                    catch TaskError.TaskAlreadyExist{
                        errorMessage("This task already exist")
                        return
                    }
                    catch {
                        errorMessage("Something went wrong")
                        return
                    }
                    
                    destination.taskAdministration = self.taskAdministration!
                }
            }
            if segue.identifier == "CancelAddTask" {
                if let destination = segue.destinationViewController as? TaskController{
                    destination.taskAdministration = taskAdministration!
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
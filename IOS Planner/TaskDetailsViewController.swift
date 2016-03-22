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
    var taskAdministration: TaskAdministration?

    
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
            var check = -1
            do{
               check = try taskAdministration!.CheckForTask(task!)
            }
            catch TaskError.NoTaskValues{
                errorMessage("This task doesn't contain any values")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check >= 0){
                self.performSegueWithIdentifier("RemoveDetailToTask", sender: self)
            }
            else{
                errorMessage("This task doesn't exist")
            }
        }
        
    }

    @IBAction func TaskChangeButton(sender: AnyObject) {
        if(taskDetailsTitel.text != nil && taskDetailsNotes.text != nil){
            var check = -1
            do{
                 check = try taskAdministration!.CheckForTask(task!)
            }
            catch TaskError.NoTaskValues{
                errorMessage("This task doesn't contain any values")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check >= 0)
            {
                self.performSegueWithIdentifier("ChangeDetailToTask", sender: self)
            }
            else{
                errorMessage("This task doesn't exist")
            }
        }
        
    }
    
    
    @IBAction func CancelDetailTaskButton(sender: AnyObject) {
        self.performSegueWithIdentifier("CancelDetailTask", sender: self)
    }
    
    func errorMessage(error: String){
        let alertController = UIAlertController(title: "Error", message:
            error, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(taskDetailsTitel.text != nil && taskDetailsNotes.text != nil)
        {
            let newTask = Task(Titel: taskDetailsTitel.text!, Notes: taskDetailsNotes.text, Completed: TaskCompletedSwitch.on, AccountEmail: "")
            if segue.identifier == "ChangeDetailToTask" {
                if let destination = segue.destinationViewController as? TaskController {
                    do{
                     try taskAdministration!.ChangeTask(task!, newTask: newTask)
                    }
                    catch TaskError.NoTaskValues{
                        errorMessage("This task doesn't contain any values")
                        return
                    }
                    catch TaskError.TaskAlreadyExist{
                        errorMessage("The new version of task already exist")
                        return
                    }
                    catch TaskError.TaskDoesntExist{
                        errorMessage("The old version of task never existed")
                        return
                    }
                    catch {
                        errorMessage("Something went wrong")
                        return
                    }
                    destination.taskAdministration = self.taskAdministration!
                }
            }
            if segue.identifier == "RemoveDetailToTask" {
                if let destination = segue.destinationViewController as? TaskController {
                    do{
                      try taskAdministration!.RemoveTask(task!)
                    }
                    catch TaskError.NoTaskValues{
                        errorMessage("This task doesn't contain any values")
                        return
                    }
                    catch TaskError.TaskDoesntExist{
                        errorMessage("This task doensn't exist")
                        return
                    }
                    catch {
                        errorMessage("Something went wrong")
                        return
                    }
                    destination.taskAdministration = self.taskAdministration!
                }
            }
            if segue.identifier == "CancelDetailTask" {
                if let destination = segue.destinationViewController as? TaskController {
                    destination.taskAdministration = self.taskAdministration!
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

//
//  TaskAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {

    @IBOutlet var TaskAddTitelText: UITextField!
    @IBOutlet var TaskAddNotesText: UITextView!
    var taskItem = Task(titel: "", notes: "")
    
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
        taskItem = Task(titel: TaskAddTitelText.text!, notes: TaskAddNotesText.text!)
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

//
//  NoteAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteAddViewController: UIViewController {
    var newNote = Note(information: "", accountemail: "")
    var noteAdministration: NoteAdministration?

    @IBOutlet var NoteInformationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NoteAddButton(sender: AnyObject) {
        if(NoteInformationTextView.text != nil)
        {
            newNote = Note(information: NoteInformationTextView.text, accountemail: "")
            var check = 0
            do{
                check = try noteAdministration!.CheckForNote(newNote)
            }
            catch NoteErrors.NoNoteValues{
                errorMessage("This note doesn't contain anything")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check == -1){
                performSegueWithIdentifier("NewNoteToNote", sender:self)
            }
            else{
                errorMessage("This note already exist")
            }
        }
    }
    
    @IBAction func CancelAddNoteButton(sender: AnyObject) {
        self.performSegueWithIdentifier("CancelAddNote", sender: self)
    }
    
    
    
    func errorMessage(error: String){
        let alertController = UIAlertController(title: "Error", message:
            error, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(NoteInformationTextView.text != nil)
        {
            
        if segue.identifier == "NewNoteToNote" {
            if let destination = segue.destinationViewController as? NoteController {
                do{
                    try noteAdministration!.AddNote(newNote)
                }
                catch NoteErrors.NoteAlreadyExist{
                    errorMessage("This note already exist")
                    return
                }
                catch{
                    errorMessage("Something went wrong")
                    return
                }
                destination.noteAdministration = self.noteAdministration!
                }
            }
        }
        if segue.identifier == "CancelAddNote" {
            if let destination = segue.destinationViewController as? NoteController{
                destination.noteAdministration = self.noteAdministration!
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

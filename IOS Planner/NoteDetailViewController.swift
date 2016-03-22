//
//  NoteDetailViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    var note: Note?
    var noteAdministration: NoteAdministration?
    
    @IBOutlet var NoteInformationTextView: UITextView!
    @IBOutlet var NoteDetailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NoteDetailTextView.text = note?.information
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func DeleteNoteButton(sender: AnyObject) {
        if(note != nil){
            var check = -1
            do{
             check = try noteAdministration!.CheckForNote(note!)
            }
            catch NoteErrors.NoNoteValues{
                errorMessage("This note doesn't contain any values")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check >= 0){
                self.performSegueWithIdentifier("RemoveDetailToNote", sender:self)
            }
            else{
                errorMessage("This note doesn't exist")
            }
        }
    }
    
    @IBAction func ChangeNoteButton(sender: AnyObject) {
        if(NoteInformationTextView.text != nil)
        {
            var check = -1
            do{
            check = try noteAdministration!.CheckForNote(note!)
            }
            catch NoteErrors.NoNoteValues{
                errorMessage("This note doesn't contain any values")
                return
            }
            catch{
                errorMessage("Something went wrong")
                return
            }
            if(check >= 0){
                self.performSegueWithIdentifier("ChangeDetailToNote", sender:self)
            }
            else{
                errorMessage("This note doesn't exist")
            }
        }
        
    }
    

    @IBAction func CancelDetailNoteButton(sender: AnyObject) {
        self.performSegueWithIdentifier("ChangeDetailToNote", sender: self)
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
            let newNote = Note(information: NoteInformationTextView.text, accountemail: "")
            if segue.identifier == "ChangeDetailToNote" {
                if let destination = segue.destinationViewController as? NoteController {
                    do{
                        try noteAdministration!.ChangeNote(note!, newNote: newNote)
                    }
                    catch NoteErrors.NoNoteValues{
                        errorMessage("This note doesn't contain any values")
                        return
                    }
                    catch NoteErrors.NoteAlreadyExist{
                        errorMessage("The new version of note already exist")
                        return
                    }
                    catch NoteErrors.NoteDoesntExist{
                        errorMessage("The old version of note never existed")
                        return
                    }
                    catch{
                        errorMessage("Something went wrong")
                        return
                    }
                    destination.noteAdministration = self.noteAdministration!
                }
            }
            if segue.identifier == "RemoveDetailToNote" {
                if let destination = segue.destinationViewController as? NoteController {
                    do{
                      try  noteAdministration!.RemoveNote(note!)
                    }
                    catch NoteErrors.NoNoteValues{
                        errorMessage("This note doesn't contain any values")
                        return
                    }
                    catch NoteErrors.NoteDoesntExist{
                        errorMessage("The old version of note never existed")
                        return
                    }
                    catch{
                        errorMessage("Something went wrong")
                        return
                    }
                    destination.noteAdministration = self.noteAdministration!
                }
            }
            if segue.identifier == "CancelDetailNote" {
                if let destination = segue.destinationViewController as? NoteController {
                    destination.noteAdministration = self.noteAdministration!
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

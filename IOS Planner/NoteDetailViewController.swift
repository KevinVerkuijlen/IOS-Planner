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
            self.performSegueWithIdentifier("RemoveDetailToNote", sender:self)
        }
    }

    @IBAction func ChangeNoteButton(sender: AnyObject) {
        if(NoteInformationTextView.text != nil)
        {
            self.performSegueWithIdentifier("ChangeDetailToNote", sender:self)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(NoteInformationTextView.text != nil)
        {
            let newNote = Note(information: NoteInformationTextView.text)
            if segue.identifier == "ChangeDetailToNote" {
                if let destination = segue.destinationViewController as? NoteController {
                    destination.noteAdministration.ChangeNote(note!, newnote: newNote)
                }
            }
            if segue.identifier == "RemoveDetailToNote" {
                if let destination = segue.destinationViewController as? NoteController {
                    destination.noteAdministration.RemoveNote(note!)
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

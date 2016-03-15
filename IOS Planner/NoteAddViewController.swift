//
//  NoteAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteAddViewController: UIViewController {
    var newNote = Note(information: "")

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
            self.performSegueWithIdentifier("NewNoteToNote", sender:self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(NoteInformationTextView.text != nil)
        {
             newNote = Note(information: NoteInformationTextView.text)
        if segue.identifier == "NewNoteToNote" {
            if let destination = segue.destinationViewController as? NoteController {
                destination.noteAdministration.AddNote(newNote)
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

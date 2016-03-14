//
//  NoteAddViewController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteAddViewController: UIViewController {

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
            let newNote = Note(information: NoteInformationTextView.text)
            let noteAdministration = NoteAdministration()
            noteAdministration.Notes.append(newNote)
            print(noteAdministration.Notes.count)
            self.performSegueWithIdentifier("NewNoteToNote", sender:self)
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

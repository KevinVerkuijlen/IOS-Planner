//
//  NoteAdministration.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class NoteAdministration{
    
    var Notes = [Note]()
    
    init(){
        AddNote(Note(information: "When I was testing this, at this point, everything worked fine at this point, but I noticed that I couldn’t see the disclosure indicators.  Turns out it was an issue with Auto Layout and Size classes that I just forgot to deal with earlier.  You can see the disclosure indicator just fine in the editor, but notice that the box is much wider than a normal iPhone interface?  So if you aren’t seeing the disclosure indicators, they probably are THERE, but they’re farther to the right than your screen is showing.  I just simply selected the UITableView from the Document Outline, and Pinned all of its sides (top, bottom, left and right) to 0 with “Constrain to margins” off."))
        AddNote(Note(information: "0 with “Constrain to margins” off."))
    }
    
    func AddNote(note : Note)
    {
        if(note.information != ""){
            //add loop to check not exact the same
            self.Notes.append((note))
        }
    }
    
    func RemoveNote(note : Note)
    {
        let indexofNote = self.Notes.indexOf({$0.information == note.information})
        Notes.removeAtIndex(indexofNote!)
    }
    
    func ChangeNote(oldnote: Note, newnote : Note)
    {
        let indexofNote = self.Notes.indexOf({$0.information == oldnote.information})
        Notes.removeAtIndex(indexofNote!)
        Notes.insert(newnote, atIndex: indexofNote!)
    }
    
    func LinkNote()
    {
        
    }
}
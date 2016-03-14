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
    
    func AddNote(note : Note)
    {
        if(note.information != ""){
            Notes.append((note))
        }
    }
    
    func RemoveNote(note : Note)
    {
        let indexofNote = self.Notes.indexOf({$0 === note})
        Notes.removeAtIndex((indexofNote)!)
    }
    
    func ChangeNote(oldnote: Note, newnote : Note)
    {
        let indexofNote = self.Notes.indexOf({$0 === oldnote})
        Notes.removeAtIndex((indexofNote)!)
        Notes.insert(newnote, atIndex: indexofNote!)
    }
    
    func LinkNote()
    {
        
    }
}
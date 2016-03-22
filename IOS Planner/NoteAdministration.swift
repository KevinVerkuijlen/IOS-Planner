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
    
    func AddNote(note : Note)throws
    {
        var check =  0
        do{
            check = try CheckForNote(note)
        }
        catch NoteErrors.NoNoteValues{
            NoteErrors.NoNoteValues
        }
        guard check == -1 else{
            throw NoteErrors.NoteAlreadyExist
        }
        self.Notes.append((note))
    }
    
    func RemoveNote(note : Note) throws{
        var check =  -1
        do{
            check = try CheckForNote(note)
        }
        catch NoteErrors.NoNoteValues{
            NoteErrors.NoNoteValues
        }
        guard (check >= 0) else{
            throw NoteErrors.NoteDoesntExist
        }
        Notes.removeAtIndex(check)
    }
    
    func ChangeNote(oldNote: Note, newNote : Note)
    throws {
        let oldCheck: Int
        do{ oldCheck = try CheckForNote(oldNote)}
        catch NoteErrors.NoNoteValues{
            throw NoteErrors.NoNoteValues
        }
        
        let newCheck: Int
        do{ newCheck = try CheckForNote(newNote)}
        catch NoteErrors.NoNoteValues{
            throw NoteErrors.NoNoteValues
        }
        guard (oldCheck >= 0) else{
            throw NoteErrors.NoteDoesntExist
        }
        guard newCheck == -1 else{
            throw NoteErrors.NoteAlreadyExist
        }
        
        if(oldCheck >= 0 && newCheck == -1)
        {
        Notes.removeAtIndex(oldCheck)
        Notes.insert(newNote, atIndex: oldCheck)
        }
        else{
            return
        }
    }
    
    func LinkNote()
    {
        
    }
    
    func CheckForNote(note: Note) throws -> Int{
        guard (note.information != "") else{
            throw NoteErrors.NoNoteValues
        }
       let indexofNote = self.Notes.indexOf({$0.information == note.information})
        if(indexofNote != nil){
            return indexofNote!
        }
        else{
            return -1
        }
    }
}
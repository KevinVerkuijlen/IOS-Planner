//
//  Task.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Task {
    let titel: String
    let notes: String
    var completed: Bool
    let accountEmail: String

    
    init(Titel: String, Notes: String, Completed: Bool = false, AccountEmail: String){
        self.titel = Titel
        self.notes = Notes
        self.completed = Completed
        self.accountEmail = AccountEmail

    }
    
    convenience init(Titel: String, Notes: String){
        self.init(Titel:Titel, Notes:Notes)
    }
    

}

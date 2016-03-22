//
//  Task.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Task {
    var titel: String!
    var notes: String!
    var completed: Bool!
    var accountEmail: String?
    
    init(Titel: String, Notes: String, Completed: Bool = false, AccountEmail: String){
        self.titel = Titel
        self.notes = Notes
        self.completed = Completed
        self.accountEmail = AccountEmail

    }
    

}

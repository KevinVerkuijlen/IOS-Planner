//
//  SchoolEvent.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class SchoolEvent : CalendarEvent{
    
    var Subject: String
    var Assingment: String
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData, Subject: String, Assingment: String) {
        self.Subject = Subject
        self.Assingment = Assingment
        super.init(Titel: Titel, Notes: Notes, StartDate: StartDate, EndDate: EndDate)
        
    }
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData,Subject: String, Assingment: String, AccountEmail: String) {
        self.Subject = Subject
        self.Assingment = Assingment
        super.init(Titel: Titel, Notes: Notes, StartDate: StartDate, EndDate: EndDate, AccountEmail: AccountEmail)
    }
    
}
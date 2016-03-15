//
//  CalendarEvent.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class CalendarEvent {
    var titel: String
    var notes: String
    var startDate: NSData
    var endDate: NSData
    var accountEmail: String?
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData){
        self.titel = Titel
        self.notes = Notes
        self.startDate = StartDate
        self.endDate = EndDate
    }
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData, AccountEmail: String){
        self.titel = Titel
        self.notes = Notes
        self.startDate = StartDate
        self.endDate = EndDate
        self.accountEmail = AccountEmail
        
    }
    
    
}
//
//  CalendarEvent.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class CalendarEvent {
    let titel: String
    let notes: String
    let startDate: NSData
    let endDate: NSData
    let accountEmail: String
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData, AccountEmail: String){
        self.titel = Titel
        self.notes = Notes
        self.startDate = StartDate
        self.endDate = EndDate
        self.accountEmail = AccountEmail
        
    }
    
    convenience init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData){
        self.init(Titel:Titel, Notes:Notes, StartDate:StartDate, EndDate:EndDate)
    }
    
    
}
//
//  NormalEvent.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class NormalEvent: CalendarEvent {
    
    override init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData) {
        super.init(Titel: Titel, Notes: Notes, StartDate: StartDate, EndDate: EndDate)
    }
    
    override init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData, AccountEmail: String) {
        super.init(Titel: Titel, Notes: Notes, StartDate: StartDate, EndDate: EndDate, AccountEmail: AccountEmail)
    }
}
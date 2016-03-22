//
//  GameEvent.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class GameEvent : CalendarEvent{
    var gameName: String
    
    init(Titel: String, Notes: String, StartDate: NSData, EndDate: NSData, GameName: String, AccountEmail: String) {
        self.gameName = GameName
        super.init(Titel: Titel, Notes: Notes, StartDate: StartDate, EndDate: EndDate, AccountEmail: AccountEmail)
    }
}
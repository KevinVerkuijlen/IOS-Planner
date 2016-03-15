//
//  Alarm.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Alarm {
    var alarmTime: NSData
    var accountEmail: String?
    
    init(Time: NSData){
        self.alarmTime = Time
        
    }
    
    init(Time: NSData, AccountEmail: String){
        self.alarmTime = Time
        self.accountEmail = AccountEmail
        
    }


    
}
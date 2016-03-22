//
//  Note.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Note {
    var information: String!
    var accountEmail: String?
    
    init(information: String, accountemail:String){
        self.information = information
        self.accountEmail = accountemail
    }
    
}
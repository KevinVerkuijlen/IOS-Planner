//
//  Note.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Note {
    let information: String
    let accountEmail: String
    
    init(Information: String, AccountEmail: String){
        self.information = Information
        self.accountEmail = AccountEmail
        
    }
    
    convenience init(Information: String){
        self.init(Information:Information)
    }
    
    
}
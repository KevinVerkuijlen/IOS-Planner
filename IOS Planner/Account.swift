//
//  Account.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 11-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class Account {
    let name: String
    let lastName: String
    let emailAdress: String
    let password: String
    
    init(Name: String, LastName: String, EmailAdress: String, Password: String){
        self.name = Name
        self.lastName = LastName
        self.emailAdress = EmailAdress
        self.password = Password
    }
    
}
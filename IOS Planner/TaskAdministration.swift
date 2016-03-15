//
//  TaskAdministration.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import Foundation

class TaskAdministration{
    var ToDo = [Task]()
    
    init(){
        AddTask(Task(Titel: "tandarts", Notes: "RIP"))
    }
    
    func AddTask(task: Task){
        if(task.titel != "" && task.notes != ""){
          self.ToDo.append(task)
        }
    }
    
    func RemoveTask(task: Task){
        let indexofTask = self.ToDo.indexOf({$0.titel == task.titel && $0.notes == task.notes})
        ToDo.removeAtIndex(indexofTask!)
    }
    
    func ChangeTask(oldTask: Task, newTask: Task){
        let indexofTask = self.ToDo.indexOf({$0.titel == oldTask.titel && $0.notes == oldTask.notes})
        ToDo.removeAtIndex(indexofTask!)
        ToDo.insert(newTask, atIndex: indexofTask!)
    }
    
    func taskToCalendar(){
        
    }
}
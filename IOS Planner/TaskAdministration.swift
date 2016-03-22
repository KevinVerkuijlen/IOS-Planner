//
//  TaskAdministration.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 14-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//


class TaskAdministration{
    var ToDo = [Task]()

    
    func AddTask(task: Task) throws{
        var check = 0
        do{
           check = try CheckForTask(task)
        }
        catch TaskError.NoTaskValues{
            TaskError.NoTaskValues
        }
        guard check == -1 else{
            throw TaskError.TaskAlreadyExist
        }
        self.ToDo.append(task)
    }
    
    func RemoveTask(task: Task) throws{
        var check = -1
        do{
            check = try CheckForTask(task)
        }
        catch TaskError.NoTaskValues{
            TaskError.NoTaskValues
        }
        guard (check >= 0) else{
            throw TaskError.TaskDoesntExist
        }
        ToDo.removeAtIndex(check)
    }
    
    func ChangeTask(oldTask: Task, newTask: Task) throws{
        let oldCheck: Int
        do{
        oldCheck = try CheckForTask(oldTask)
        }
        catch TaskError.NoTaskValues{
            throw TaskError.NoTaskValues
        }
        let newCheck: Int
        do{
        newCheck = try CheckForTask(newTask)
        }
        catch TaskError.NoTaskValues{
            throw TaskError.NoTaskValues
        }
        
        guard (oldCheck >= 0) else{
            throw TaskError.TaskDoesntExist
        }
        guard newCheck == -1 else{
            throw TaskError.TaskAlreadyExist
        }
        
        if(oldCheck >= 0 && newCheck == -1){
        ToDo.removeAtIndex(oldCheck)
        ToDo.insert(newTask, atIndex: oldCheck)
        }
        else{
            return
        }
    }
    
    func TaskToCalendar(){
        
    }
    
    func CheckForTask(task: Task) throws-> Int{
        guard ((task.titel != "") && (task.notes != "")) else
        {
            throw TaskError.NoTaskValues
        }
        let indexofTask = self.ToDo.indexOf({$0.titel == task.titel && $0.notes == task.notes && $0.completed == task.completed})
        if(indexofTask != nil){
            return indexofTask!
        }
        else{
            return -1
        }
        
        
    }
}
//
//  NoteController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteadministration = NoteAdministration()
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteadministration.Notes.append(Note(information: "aaa"))
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteadministration.Notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
        cell.textLabel?.text = noteadministration.Notes[indexPath.item].information
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NoteToDetail" {
            if let destination = segue.destinationViewController as? NoteDetailViewController {
                 let Index = self.tableview.indexPathForSelectedRow!.row
                    destination.note = noteadministration.Notes[Index]
            }
        }
    }

    
}

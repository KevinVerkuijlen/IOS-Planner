//
//  NoteController.swift
//  IOS Planner
//
//  Created by Kevin Verkuijlen on 09-03-16.
//  Copyright © 2016 Kevin Verkuijlen. All rights reserved.
//

import UIKit

class NoteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteAdministration = NoteAdministration()
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return noteAdministration.Notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
        cell.textLabel?.text = noteAdministration.Notes[indexPath.item].information
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NoteToDetail" {
            if let destination = segue.destinationViewController as? NoteDetailViewController {
                 let Index = self.tableview.indexPathForSelectedRow!.row
                    destination.note = noteAdministration.Notes[Index]
            }
        }
    }

    
}

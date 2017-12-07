//
//  AlarmTableViewController.swift
//  alarm_clock
//
//  Created by Arsalan Wahid Asghar on 11/29/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {

    var alarms = [Alarm]()
    
    @IBOutlet weak var edit: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseidentifier = "alarmCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as? AlarmTableViewCell else{
            fatalError("The deque is not member of AlarmTableViewCell")
        }
        let alarm = alarms[indexPath.row]
        cell.date.text = alarm.date
        cell.time.text = alarm.time
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            alarms.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    //implementation of what happens when user moves cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = self.alarms[sourceIndexPath.row]
        alarms.remove(at: sourceIndexPath.row)
        alarms.insert(temp, at: destinationIndexPath.row)
        
    }
    
    //Allows if user can moves table cells
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
       return true
    }
    
    //MARK:- UNWIND
    @IBAction func unwindToAlarmList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? DateViewController , let alarm = sourceViewController._alarm{
            
            let newIndexPath = IndexPath(row: alarms.count, section: 0)
            alarms.append(alarm)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}

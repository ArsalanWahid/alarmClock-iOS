//
//  DateViewController.swift
//  alarm_clock
//
//  Created by Arsalan Wahid Asghar on 11/29/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    var _alarm:Alarm?
    let _formatter = DateFormatter()
    
    //MARK:- Outlets
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK:- Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the format for date
        _formatter.dateFormat = "MMMM dd, YYYY"
        dateLabel.text = _formatter.string(from: datepicker.date)
        //Set the format for time
       
        _formatter.dateFormat = "hh:mm"
        timeLabel.text = _formatter.string(from: datepicker.date)
        
        //Set the mode for datepicker
        datepicker.datePickerMode = .dateAndTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //MARK:- Actions
    
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        
        //Set the date and time when picked by user
        //Set the format for date
        _formatter.dateFormat = "MMMM dd, YYYY"
        dateLabel.text = _formatter.string(from: datepicker.date)
         _formatter.dateFormat = "hh:mm"
        timeLabel.text = _formatter.string(from: datepicker.date)
        
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
        
    
    

    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let date = dateLabel.text ?? ""
        let time = timeLabel.text ?? ""
        
         _alarm = Alarm(date: date, time: time)
        }
    
   


}

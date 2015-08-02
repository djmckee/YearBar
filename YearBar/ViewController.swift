//
//  ViewController.swift
//  YearBar
//
//  Created by Dylan McKee on 02/08/2015.
//  Copyright (c) 2015 djmcke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressCircle:CircularProgressView?
    @IBOutlet weak var progressLabel:UILabel?
    @IBOutlet weak var daysLeftLabel:UILabel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // perform initial update
        update()
        
        // and subscribe to significant time changes so we update automatically at midnight...
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update", name: UIApplicationSignificantTimeChangeNotification, object: nil)
    }
    
    @objc func update() {
        let currentDay = YearCalculator.currentDayNumber()
        let totalDays = YearCalculator.numberOfDaysInCurrentYear()
        let currentYear = YearCalculator.currentYear()
        
        // set up progress bar...
        let progress:Float = Float(Float(currentDay) / Float(totalDays))
        print(progress)
        progressCircle?.value = CGFloat(progress)
        
        // format strings and set them too...
        let daysString = String(format: "%d/%d", currentDay, totalDays)
        progressLabel?.text = daysString
        
        let daysLeft = (totalDays - currentDay)
        
        var dayString = "days"
        
        if daysLeft == 1 {
            dayString = "day"
        }
        
        let daysLeftString = String(format: "%d %@ left of %d.", daysLeft, dayString, currentYear)
        daysLeftLabel?.text = daysLeftString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


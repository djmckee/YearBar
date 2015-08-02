//
//  GlanceController.swift
//  YearBar WatchKit Extension
//
//  Created by Dylan McKee on 02/08/2015.
//  Copyright (c) 2015 djmcke. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {
    @IBOutlet weak var daysCompleteLabel:WKInterfaceLabel?
    @IBOutlet weak var totalDaysLabel:WKInterfaceLabel?
    @IBOutlet weak var daysLeftLabel:WKInterfaceLabel?


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        update()
    }
    
    private func update() {
        let currentDay = YearCalculator.currentDayNumber()
        let totalDays = YearCalculator.numberOfDaysInCurrentYear()
        let currentYear = YearCalculator.currentYear()
        
        // format strings and set them too...
        let currentDayString = String(format: "%d", currentDay)
        daysCompleteLabel?.setText(currentDayString)
        
        let totalDaysString = String(format: "/%d", totalDays)
        totalDaysLabel?.setText(totalDaysString)
        
        let daysLeft = (totalDays - currentDay)
        
        var dayString = "days"
        
        if daysLeft == 1 {
            dayString = "day"
        }
        
        let daysLeftString = String(format: "%d %@ left of %d.", daysLeft, dayString, currentYear)
        daysLeftLabel?.setText(daysLeftString)

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        update()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

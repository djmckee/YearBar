//
//  TodayViewController.swift
//  TodayYearBar
//
//  Created by Dylan McKee on 02/08/2015.
//  Copyright (c) 2015 djmcke. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var progressBar:UIProgressView?
    @IBOutlet weak var progressLabel:UILabel?
    @IBOutlet weak var daysLeftLabel:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.preferredContentSize = CGSize(width: 0, height: 72)
        
        updateProgress()
        
        
        
        
    }
    
    private func updateProgress() {
        
        let currentDay = YearCalculator.currentDayNumber()
        let totalDays = YearCalculator.numberOfDaysInCurrentYear()
        let currentYear = YearCalculator.currentYear()
        
        // set up progress bar...
        let progress:Float = Float(Float(currentDay) / Float(totalDays))
        //print(progress)
        progressBar?.setProgress(progress, animated: true)
        
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
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        updateProgress()
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    
    
}
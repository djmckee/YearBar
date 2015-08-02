//
//  YearCalculator.swift
//  YearBar
//
//  Created by Dylan McKee on 02/08/2015.
//  Copyright (c) 2015 djmcke. All rights reserved.
//

import Foundation

// A simple utility class to calculate the progress throught the current year, and the number of days left
public class YearCalculator {
    
    // internal conveneince method to reduce code duplication, don't expose publicly to keep API as simple as possible
    private static func firstDayOfYear(year: Int) -> NSDate {
        // create 1/1/year from date components, and return it
        let dateComponents:NSDateComponents = NSDateComponents()
        
        dateComponents.month = 1
        dateComponents.day = 1
        dateComponents.year = year
        
        return dateComponents.date!
        
    }
    
    public static func numberOfDaysInCurrentYear() -> Int {
        // get the first date of this year, and first day of next, then subtract to get number of days...
        
        let currentDateComponents = NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate:  NSDate())
        
        let currentYear = currentDateComponents.year
        let nextYear = currentYear + 1
        
        let firstDayOfThisYear = firstDayOfYear(currentYear)
        let firstDayOfNextYear = firstDayOfYear(nextYear)
        
        // do the subtraction of the two dates...
        let subtractedDayComponents = NSCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: firstDayOfThisYear, toDate: firstDayOfNextYear, options: NSCalendarOptions.allZeros)
        
        // and return computed days..
        return subtractedDayComponents.day
        
    }
    
}
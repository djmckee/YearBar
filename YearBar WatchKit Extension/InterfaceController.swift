//
//  InterfaceController.swift
//  YearBar WatchKit Extension
//
//  Created by Dylan McKee on 02/08/2015.
//  Copyright (c) 2015 djmcke. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var daysLabel:WKInterfaceLabel?
    @IBOutlet weak var daysLeftLabel:WKInterfaceLabel?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        update()
    }

    
    private func update() {
        
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

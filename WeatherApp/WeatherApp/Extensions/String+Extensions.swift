//
//  String+Extensions.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

extension String {
    // Turns a number of seconds into a human readable date. 
    func intervalIntoDate(_ time: Int) -> String {
        let humanDate = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: humanDate as Date)
    }
    // Turns a number of seconds into a human readable time of date.
    func intervalIntoTime(_ time: Int) -> String {
        let humanDate = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: humanDate as Date)
    }
}

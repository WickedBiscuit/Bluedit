//
//  GeneralHelper.swift
//  Bluedit
//
//  Created by Marcus on 24/06/2024.
//

import Foundation

func convertTimeInterval(from timestamp: Date) -> String {
    let now = Date()
    let seconds = Int(now.timeIntervalSince(timestamp))
    
    let interval = seconds / 31536000 // years
    if interval >= 1 {
        return "\(interval)yr"
    }
    
    let months = seconds / 2592000 // months
    if months >= 1 {
        return "\(months)mo"
    }
    
    let days = seconds / 86400 // days
    if days >= 1 {
        return "\(days)d"
    }
    
    let hours = seconds / 3600 // hours
    if hours >= 1 {
        return "\(hours)h"
    }
    
    let minutes = seconds / 60 // minutes
    if minutes >= 1 {
        return "\(minutes)m"
    }
    
    return "\(seconds)s" // seconds
}

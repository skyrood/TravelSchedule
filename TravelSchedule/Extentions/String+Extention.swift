//
//  String+Extention.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/09/24.
//

import Foundation

extension String {
    var timeValue: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.date(from: self)
    }
    
    var hourComponent: Int? {
        let parts = split(separator: ":")
        if let hourString = parts.first, let hour = Int(hourString) {
            return hour
        }
        return nil
    }
    
    var dateValue: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
}

//
//  DateHelper.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation

public class GITSDateHelper {
    public static let dateUTCFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    public static func dateNow()-> Date {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        return calender.date(from: components)!
    }
    
    public static func getLocalGMT() -> String {
        var zoneStr: String?
        let timeZone = DateFormatter().timeZone.secondsFromGMT(for: Date())/3600
        switch timeZone {
        case 7:
            zoneStr = "WIB"
        case 8:
            zoneStr = "WITA"
        case 9:
            zoneStr = "WIT"
        default:
            zoneStr = "-"
        }
        return zoneStr ?? "-"
    }
    
    public static func dateParseToString(_ date: String, oldFormat: String, newFormat: String)-> String{
        let currentDate = UTCToLocal(date: date, format: oldFormat)
        var newDateString = "fail to convert date"
        if let mydate = UTCToLocalDate(date: currentDate, format: oldFormat){
            newDateString = UTCToLocal(date: mydate, format: newFormat)
        }
        return newDateString
    }
    
    public static func dateParseToDate(_ date: String, oldFormat: String, newFormat: String)-> Date{
        let currentDate = UTCToLocal(date: date, format: oldFormat)
        let mydate = UTCToLocalDate(date: currentDate, format: oldFormat)
        return mydate!
    }
    
    public static func getHjrDate(_ date: String, oldFormat: String) -> String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = oldFormat
        let theDate = dateFormat.date(from: date)
        
        let islamic = Calendar(identifier: .islamicCivil)
        let components = islamic.dateComponents([.year, .month, .day], from: theDate!)
        let date = "\(String(describing: components.day!)) \(String(describing: components.month!)) \(String(describing: components.year!))"
        let hijrDate = date.components(separatedBy: " ")
        var resultDate = ""
        let month = hijrDate[1]
        let hijrMonth = ["Muharram", "Shafar", "Rabi'ul Awal",
                         "Rabi'ul Akhir", "Jumadil Ula", "Jumadil Akhir", "Rajab",
                         "Sya'ban", "Ramadhan", "Syawwal", "Dzul Qa'dah", "Dhul Hijjah"]
        for i in 0..<hijrMonth.count{
            if i == Int(month)!-1{
                resultDate = hijrDate.first! + " " + hijrMonth[i] + " " + hijrDate.last!
            }
        }
        return resultDate
    }
    
    public static func dateParseToDate(_ date: Date, newFormat: String)-> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        let dateString = dateFormatter.string(from: date)
        let currentDate = UTCToLocalDate(date:dateString, format: newFormat)
        return currentDate ?? date
    }
    
    public static func stringParseToDate(_ date: String, newFormat: String)-> Date{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = newFormat
//        let theDate = dateFormatter.date(from: date)
//        let dateString = dateFormatter.string(from: theDate!)
        let currentDate = UTCToLocalDate(date: date, format: newFormat)
        return currentDate ?? Date()
    }
    
    public static func dateParseToString(_ date: Date, newFormat: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        let dateString = dateFormatter.string(from: date)
        let currentDate = UTCToLocal(date:dateString, format: newFormat)
        return currentDate
    }
    
    public static func timeAgoStringFrom(date: String, format: String) -> String {
        let currentDate = UTCToLocal(date:date, format: format)
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        let dateResult = dateFormat.date(from: currentDate)
        
        if dateResult != nil {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            
            let now = Date()
            
            let calendar = Calendar.current
            let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month, .weekOfMonth, .day, .hour, .minute, .second]), from: dateResult!, to: now)
            
            var isMonth = false
            var isYear = false
            var isYesterday = false
            
            if components.year! > 0 {
                isYear = true
                dateFormat.dateFormat = "MMM dd, yyyy"
                formatter.allowedUnits = .year
            } else if components.month! > 0 {
                isMonth = true
                dateFormat.dateFormat = "MMM dd"
                formatter.allowedUnits = .month
            } else if components.weekOfMonth! > 0 {
                formatter.allowedUnits = .weekOfMonth
            } else if components.day! > 0 {
                formatter.allowedUnits = .day
                if components.day! == 1 {
                    isYesterday = true
                }
            } else if components.hour! > 0 {
                formatter.allowedUnits = .hour
            } else if components.minute! > 0 {
                formatter.allowedUnits = .minute
            } else {
                formatter.allowedUnits = .second
            }
            
            let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
            
            guard let timeString = formatter.string(from: components) else {
                return "Error"
            }
            
            if isMonth || isYear {
                return dateFormat.string(from: dateResult!)
            } else if isYesterday {
                return "Yesterday"
            } else {
                return String(format: formatString, timeString)
            }
        } else {
            return "Error Date"
        }
    }
    
    public static func UTCToLocal(date:String, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "id")
        
        let dt = dateFormatter.date(from: date)
        return dt != nil ? dateFormatter.string(from: dt!) : ""
    }
    
    public static func UTCToLocal(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "id")
        
        let dt = dateFormatter.string(from: date)
        return dt
    }
    
    public static func UTCToLocalDate(date:String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "id")
        
        let dt = dateFormatter.date(from: date)
        return dt
    }
}

extension Date {
    public func compareTimeOnly(to: Date) -> ComparisonResult {
        let calendar = Calendar.current
        let components2 = calendar.dateComponents([.hour, .minute, .second], from: to)
        let date3 = calendar.date(bySettingHour: components2.hour!, minute: components2.minute!, second: components2.second!, of: self)!

        let seconds = calendar.dateComponents([.second], from: self, to: date3).second!
        if seconds == 0 {
            return .orderedSame
        } else if seconds > 0 {
            return .orderedAscending
        } else {
            return .orderedDescending
        }
    }
}

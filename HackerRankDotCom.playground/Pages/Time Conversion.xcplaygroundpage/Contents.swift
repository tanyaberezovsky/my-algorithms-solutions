//: [Previous](@previous)

import Foundation


func timeConversion(_ s: String) -> String {
    let shortTime = String(s.prefix(s.count - 2))
    if isAM(s) {
        return convertTo24HourFromAM(shortTime)
    } else {
        return convertTo24HourFromPM(shortTime)
    }

}

func isAM(_ s: String) -> Bool {
    return  s.hasSuffix("AM")
}

func convertTo24HourFromAM(_ shortTime: String) -> String {
    let hours = Int(shortTime.prefix(2))
    if hours == 12 {
        return "00\(shortTime.suffix(shortTime.count - 2))"
    }
    return shortTime
}

func convertTo24HourFromPM(_ shortTime: String) -> String {
    let hours = Int(shortTime.prefix(2)) ?? 0
    if hours == 12 {
        return shortTime
    } else {
        return "\(hours+12)\(shortTime.suffix(shortTime.count - 2))"
    }
}

timeConversion("12:02:25AM")
timeConversion("05:02:25AM")
timeConversion("12:02:25PM")
timeConversion("09:02:25PM")



func timeConversion02(_ s: String) -> String {
    let suffix = s.suffix(2)
    let preffix = s.prefix(2)
    let rawTime = s.prefix(8)
    if suffix == "AM" {
        
    } else {
        
    }
    return ""
}

timeConversion02("12:02:25AM")
timeConversion02("05:02:25AM")
timeConversion02("12:02:25PM")
timeConversion02("09:02:25PM")

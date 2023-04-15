/*
Date.swift
Date extension
16/10/2021
Created by Sean Lee
*/
public extension Date{
    public static func startOfThisWeek() -> Date {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set([.yearForWeekOfYear, .weekOfYear]), from: Date())
        
        return calendar.date(from: components)!
    }
    
    public static func endOfThisWeek(returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        if returnEndTime {
            components.day = 7
            components.second = -1
            
        } else {
            components.day = 6
        }
        
        return calendar.date(byAdding: components, to: startOfThisWeek())!
    }
    
    public func date(byAddingDays: Int) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.day = byAddingDays
        
        return calendar.date(byAdding: components, to: self)!
    }
}

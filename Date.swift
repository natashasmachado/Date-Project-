//
//  Date.swift
//  Assignment2
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation


struct Date: Comparable {
    var month: Int
    var day: Int
    var year: Int
    var format = DateFormat.standard
    init (day: Int = 1 , month: Int = 1 , year: Int = 2000) {
        self.month = min(max(month, 1), 12)
        if month < 1 && month >= 12 {
            self.month = 1
            self.day = 1
            self.year = 2000
        } else {
            self.month = month
        }
        self.year = min(max(year, 0), 9999)
        if year < 1900 && year > 2500 {
            self.month = 1
            self.day = 1
            self.year = 2000
        }
        if day < 1 && day >= 31 {
            self.day = 1
        } else {
            self.day = day
        }
        var limit = -1
        if month == 2 {
            limit = 28
        }
        if month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 {
            limit = 31
        } else {
            limit = 30
        }
    }
    func daysMonth(month: Int)  -> Int {
        switch month {
        case 1 , 3 , 5 , 7 , 8 , 10 , 12 :
            return 31
        case 2 :
            return 28
        default :
            return 30
        }
    }
    mutating func input() {
        while true {
            print("Type the date")
            if let info = readLine() {
                let array = info.components(separatedBy: "/")
                if array.count == 3 {
                    var numbs = [0,0,0]
                    if let m = Int(array[0]) {
                        numbs[0] = m
                    } else {
                        print("Invalid input")
                        continue
                    }
                    if let d = Int(array[1]) {
                        numbs[1] = d
                    } else {
                        print("Invalid input")
                        continue
                    }
                    if let y = Int(array[2]) {
                        numbs[2] = y
                    } else {
                        print("Invalid input")
                        continue
                    }
                    if numbs[0] < 1 && numbs[0] > 12 {
                        print("Invalid input")
                        continue
                    }
                    if numbs[1] < 1 && numbs[1] > daysMonth(month: numbs[0]) {
                        print("Invalid input")
                        continue
                    }
                    if numbs[2] < 1900 && numbs[2] > 9999 {
                        print("Invalid input")
                        continue
                    }
                    month = numbs[0] ; day = numbs[1] ; year = numbs[2]
                }
            }
        }
    }
    mutating func set(month: Int, day: Int, year: Int) -> Bool {
        if month < 1 || month > 12 {
            return false }
        if day < 1 || day > daysMonth(month: month) {
            return false
        }
        if year < 1 || year > 9999 {
            return false
        }
        return true
    }
    
    mutating func increment(_ numDays: Int = 1) { // could've used the dateComponents ?
        var addDays = numDays
        while addDays > 0 {
            let remainDays = daysMonth(month: month) - day  // % days left
            if remainDays < addDays  {
                addDays -= remainDays + 1
                day = 1
                if month < 12 {
                    month  += 1
                } else {
                    year += 1
                    month = 1
                }
            } else {
                day += addDays
                addDays = 0
            }
        }
    }
    
    static func <(lhs: Date, rhs: Date) -> Bool {
        if lhs.year < rhs.year {
            return true
        } else if  lhs.year > rhs.year {
            return false
        }
        if lhs.month < rhs.month {
            return true
        } else if lhs.month > rhs.month {
            return false
        }
        if lhs.day < rhs.day {
            return true
        } else {
            return false
        }
    }
    
    static func ==(lhs: Date, rhs: Date) -> Bool {
        if lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year {
            return true
        }
        return false
    }
    
    
    
    func show() {
        switch format {
        case .standard:
            print("\(month)/\(day)/\(year)")
        case .two :
            var m = String(month)
            var d = String(day)
            var y = String(year)
            if month > 10 {
                m.insert("0", at: m.startIndex)
            }
            if day > 10 {
                d.insert("0", at: d.startIndex)
            }
            y = String(y.suffix(2))
            print("\(m)/\(d)/\(y)")
        case .long :
            var m = String(month)
            if  month == 1 {
                m = "Jan"
            }
            if month == 2 {
                m = "Feb"
            }
            if month == 3 {
                m = "Mar"
            }
            if month == 4 {
                m = "Apr"
            }
            if month == 5 {
                m = "May"
            }
            if month == 6 {
                m = "Jun"
            }
            if month == 7 {
                m = "Jul"
            }
            if  month == 8 {
                m = "Aug"
            }
            if month == 9 {
                m = "Sep"
            }
            if month == 10 {
                m = "Oct"
            }
            if month == 11 {
                m = "Nov"
            }
            if month == 12 {
                m = "Dec"
            }
        }
    }
}


enum DateFormat {
    case standard, two, long
}

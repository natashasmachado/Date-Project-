//
//  Date.swift
//  Assignment2
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Date {
    var month: Int
    var day: Int
    var year: Int
    var format = DateFormat.standard 
    init (day: Int = 1 , month: Int = 1 , year: Int = 2000) {
        self.month = min(max(month, 1), 12)
        if month < 1 && month > 12 {
            self.month = 1
            self.day = 1
            self.year = 2000
        } else {
            self.month = month
        }
        self.year = min(max(year, 1900), 2500)
        if year < 1900 && year > 2500 {
            self.month = 1
            self.day = 1
            self.year = 2000
        }
        if day < 1 && day > 31 {
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
                    }
                    if let d = Int(array[1]) {
                        numbs[1] = d
                    } else {
                        print("Invalid input")
                    }
                    if let y = Int(array[2]) {
                        numbs[2] = y
                    } else {
                        print("Invalid input")
                    }
                    
                    
                }
            }
        }
    }
    func show() {
        switch format {
        case .standard:
            print(month + "/" + day + "/" + year )
        case .two :
            let array = info.components(separatedBy: "/")
            if array.count == 3 {
                var numbs = [0,0,0]
                var chzero: Character = "0"
                if let m = String(array[0]) { // for month form 1..9 add 0 before
                    if m == 1 || m == 2 || m == 3 || m == 4 || m = 5 || m == 6 || m == 7 || m == 8 || m == 9 {
                        var i = m.index(m.startIndex, offsetBy: 1)
                        m.insert(chzero, at: i)
                    } else {
                        m = self.m
                    }
                }
                if let d = String(array[2]) {
                    if d == 1 || d == 2 || d == 3 || d == 4 || d = 5 || d == 6 || d == 7 || d == 8 || d == 9 {
                        var i = m.index(m.startIndex, offsetBy: 1)
                        d.insert(chzero, at: i)
                    } else {
                        d = self.d
                    }
                }
                var twoDigYear = 0
                if let y = String(array[3]) {
                    let index = y.index(y.startIndex, offsetBy: 2)
                    y.suffix(from: index)
                    twoDigYear = y
                }
            }
        case .long :
            
            
            enum DateFormat {
                case standard, long, two
            }
            
        }

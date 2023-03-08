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
    
    enum DateFormat {
        case standard, long, two
    }
    

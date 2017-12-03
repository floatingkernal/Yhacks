//
//  parsing.swift
//  MyToDo
//
//  Created by Salman Sharif on 2017-12-03.
//  Copyright © 2017 Bruno Philipe. All rights reserved.
//

import Foundation


let file = "Deals.csv" //this is the file. we will write to and read from it

var airports = [String]()

func Parse(numberDeparture:String, numberDestination:String) -> Int {
    if let filePath = Bundle.main.path(forResource: "Deals", ofType: "csv"){
        do {
            let content = try String(contentsOfFile: filePath)
            var res = 0
            var count = 0
            for row in content.components(separatedBy: "\n") {
                var cells = row.components(separatedBy: ",")
                addToAirports(cells: cells)
                if cells.count > 1{
                    if cells[1] == numberDeparture && cells[2] == numberDestination {
                        res += Int(Double(cells[6])!)
                        count+=1
                    }
                }
                
            }
            if count == 0 {
                count = 1
            }
            return res/count
            

        } catch {
            return -1
            
            
        }
    } else {
        return -1
    }
    
}
private func addToAirports(cells:[String]) {
    if cells.count > 1 {
        if cells[1].count == 3 && cells[2].count == 3 {
            if !airports.contains(cells[1]) {
                airports.append(cells[1])
            }
            if !airports.contains(cells[2]) {
                airports.append(cells[2])
            }
        }
    }
}

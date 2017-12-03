//
//  rateit.swift
//  Yhacks
//
//  Created by Salman Sharif on 2017-12-02.
//  Copyright © 2017 Salman Sharif. All rights reserved.
//

import Foundation

var rates = [Int]()
var todoItems = [ToDoItem]()

func rateIt(input:[Int], skew:Int) -> Int {
    var res = 0
    for i in input {
        res += i
    }
    let s = (skew+input.capacity)/100
    res = res*s
    return res
}

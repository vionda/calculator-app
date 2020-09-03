//
//  StructsEnums.swift
//  Calculator
//
//  Created by Vionda on 9/3/20.
//  Copyright © 2020 Vionda. All rights reserved.
//

import Foundation

enum Operator: String{
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum calculationState: String{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}

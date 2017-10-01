//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Christopher Lee on 2/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    var destination : String?
    
    override func drive() {
        super.drive()
        
        // Optional Binding
        if let userSetDestination = destination {
            print("driving towards \(userSetDestination )")
        }
    }
}

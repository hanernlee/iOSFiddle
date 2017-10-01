//
//  Car.swift
//  Classes and Objects
//
//  Created by Christopher Lee on 2/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var colour = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    
    convenience init(customerChosenColour : String) {
        self.init()
        colour = customerChosenColour
    }
    
    func drive() {
        print("Car is moving")
    }
}

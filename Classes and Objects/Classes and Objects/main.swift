//
//  main.swift
//  Classes and Objects
//
//  Created by Christopher Lee on 2/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

let myCar = Car()

let richCar = Car(customerChosenColour: "Gold")

let mySelfDrivingCar = SelfDrivingCar()

print(mySelfDrivingCar.colour)

mySelfDrivingCar.destination = "1 Hacker Way"
mySelfDrivingCar.drive()

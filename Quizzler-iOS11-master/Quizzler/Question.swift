//
//  Question.swift
//  Quizzler
//
//  Created by Christopher Lee on 27/9/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    // Constant or property of a class
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

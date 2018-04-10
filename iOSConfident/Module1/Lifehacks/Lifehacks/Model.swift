//
//  Model.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 10/04/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import Foundation

struct User {
	let name: String
	let aboutMe: String
	let profilePictureName: String
	let reputation: Int
}

struct Question {
	let title: String
	let body: String
	fileprivate (set) var score: Int
	let owner: User
	
	mutating func voteUp() {
		score += 1
	}
	
	mutating func voteDown() {
		score -= 1
	}
}

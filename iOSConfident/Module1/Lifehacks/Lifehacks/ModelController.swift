//
//  ModelController.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 10/04/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import Foundation

class ModelController {
	
	var topQuestion: Question = {
		let title = "How to find a hole in a bicycle tire tube quickly"
		let body = "The tube inside by bicycle tire (inner-tube) got a hole and now I can't ride the bike. It isn't a big hole, so I am going to repair it myself. The only problem is that it takes an extremely long time to find the hole. I usually run my finger around the entire tube looking for it, until I eventually find it. This usually takesN 20-30 minutes. There must be an better alternative. What is an easy way to quickly find a hole in a tire tube?"
		let owner = User(name: "michalepri", aboutMe: "Moderator Pro Tempore on Lifehacks.SE", profilePictureName: "michaelpri", reputation: 5276)
		return Question(title: title, body: body, score: 24, owner: owner)
	}()
	
	var user = User(name: "John Doe", aboutMe: "I am the user of this app", profilePictureName: "ProfilePicture", reputation: 100)
}

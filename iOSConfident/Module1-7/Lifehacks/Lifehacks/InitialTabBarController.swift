//
//  InitialTabBarController.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 27/05/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

class InitialTabBarController: UITabBarController, Stateful {
	
	var modelController: ModelController!
	
	override func viewDidLoad() {
		for navigationController in viewControllers as! [UINavigationController] {
			if let statefulViewController = navigationController.viewControllers.first as? Stateful {
				passState(to: statefulViewController)
			}
		}
	}
}

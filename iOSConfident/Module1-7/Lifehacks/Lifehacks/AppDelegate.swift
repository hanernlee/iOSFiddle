//
//  AppDelegate.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 09/04/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let modelController = ModelController()
		if let initialViewController = window?.rootViewController as? Stateful {
			initialViewController.modelController = modelController
		}
		return true
	}
}

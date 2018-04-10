//
//  UserEditingViewController.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 19/04/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

protocol UserEditingViewControllerDelegate {
	func userEditingViewControllerDidSave()
}

class UserEditingViewController: UIViewController, Stateful {
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var aboutMeTextView: UITextView!
	
	var modelController: ModelController!
	var delegate: UserEditingViewControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let user = modelController?.user {
			nameTextField.text = user.name
			aboutMeTextView.text = user.aboutMe
		}
	}
	
	@IBAction func save(_ sender: AnyObject) {
		if let modelController = modelController, let name = nameTextField.text, let aboutMe = aboutMeTextView.text {
			let oldUser = modelController.user
			modelController.user = User(name: name, aboutMe: aboutMe, profilePictureName: oldUser.profilePictureName, reputation: oldUser.reputation)
			delegate?.userEditingViewControllerDidSave()
			dismiss(animated: true, completion: nil)
		} else {
			let title = "Missing name or about me"
			let message = "Both name and about me need to be present to be able to save your editing"
			let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
			let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alertController.addAction(cancelAction)
			present(alertController, animated: true, completion: nil)
		}
	}
	
	@IBAction func cancel(_ sender: AnyObject) {
		dismiss(animated: true, completion: nil)
	}
}

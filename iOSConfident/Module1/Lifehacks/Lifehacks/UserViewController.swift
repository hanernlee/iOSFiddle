//
//  UserViewController.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 19/04/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, Stateful {
	@IBOutlet weak var profilePictureImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var reputationLabel: UILabel!
	@IBOutlet weak var aboutMeLabel: UILabel!
	
	var user: User?
	var modelController: ModelController!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let user = self.user {
			set(user)
			navigationItem.rightBarButtonItem = nil
		} else {
			set(modelController.user)
		}
	}
	
	fileprivate func set(_ user: User) {
		profilePictureImageView.image = UIImage(named: user.profilePictureName)
		nameLabel.text = user.name
		reputationLabel.text = "\(user.reputation)"
		aboutMeLabel.text = user.aboutMe
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? UserEditingViewController {
			passState(to: destination)
			destination.delegate = self
		}
	}
}

extension UserViewController: UserEditingViewControllerDelegate {
	func userEditingViewControllerDidSave() {
		nameLabel.textColor = UIColor.green
		reputationLabel.textColor = UIColor.green
		aboutMeLabel.textColor = UIColor.green
	}
}

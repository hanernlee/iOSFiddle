//
//  Stateful.Swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 29/05/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

protocol Stateful: class {
	var modelController: ModelController! { get set }
}

extension Stateful {
	func passState(to destination: Stateful) {
		destination.modelController = modelController
	}
}

//
//  PurchaseViewController.swift
//  DesignCodeApp
//
//  Created by Christopher Lee on 2/6/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    @IBOutlet var panToClose: InteractionPanToClose!

    override func viewDidLoad() {
        super.viewDidLoad()

        panToClose.setGestureRecognizer()
    }
}

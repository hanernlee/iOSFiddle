//
//  CardInfoViewController.swift
//  Card
//
//  Created by Christopher Lee on 25/4/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import UIKit

class CardInfoViewController: UIViewController {
    var oldFrame: CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(oldFrame)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}

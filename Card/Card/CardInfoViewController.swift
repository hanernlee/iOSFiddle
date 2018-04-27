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
    
    let coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 14
        coverImageView.image = UIImage(named: "coverbg")
        return coverImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}

//
//  ViewController.swift
//  Card
//
//  Created by Christopher Lee on 25/4/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cardView: UIView = {
        let cardView = UIView()
        cardView.frame = CGRect(x: 20, y: 255, width: 300, height: 250)
        cardView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cardView.layer.cornerRadius = 14
        cardView.layer.shadowOpacity = 0.25
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 10
       return cardView
    }()
    
    var oldFrame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cardView)
        cardView.center = view.center
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        cardView.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExpandCardSegue" {
            if let destinationVC = segue.destination as? CardInfoViewController {
                destinationVC.oldFrame = oldFrame
            }
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        oldFrame = cardView.frame
        performSegue(withIdentifier: "ExpandCardSegue", sender: sender)
    }
}


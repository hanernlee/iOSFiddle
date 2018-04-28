//
//  MoreViewController.swift
//  DesignCodeApp
//
//  Created by Christopher Lee on 28/4/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "More to Web" {
            let toNav = segue.destination as! UINavigationController
            let toVC = toNav.viewControllers.first! as! WebViewController
            toVC.urlString = sender as! String
        }
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://designcode.io")
    }
    
    @IBAction func communityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://spectrum.chat/design-code")
    }
}

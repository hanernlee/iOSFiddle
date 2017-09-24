//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Christopher Lee on 24/9/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomImageIndex : Int = 0
    
    @IBOutlet weak var magicBallImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askBall(_ sender: UIButton) {
        updateBallImage()
    }
    
    func updateBallImage(){
        randomImageIndex = Int(arc4random_uniform(5))
        
        magicBallImage.image = UIImage(named: imageArray[randomImageIndex])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallImage()
    }
}


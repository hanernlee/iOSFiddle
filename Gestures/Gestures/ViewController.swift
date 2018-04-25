//
//  ViewController.swift
//  Gestures
//
//  Created by Christopher Lee on 16/4/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cardView = UIView()
    let scrollView = UIScrollView()
    var animator: UIViewPropertyAnimator!

    var currentVelocity: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        cardView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        cardView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cardView.layer.cornerRadius = 14
        cardView.layer.shadowOpacity = 0.25
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 10

        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
        scrollView.backgroundColor = .red

        view.addSubview(scrollView)

        scrollView.addSubview(cardView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        scrollView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 3, curve: .easeOut, animations: {
                self.scrollView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
//            scrollView.fractionComplete = recognizer.translation(in: scrollView).x / 275
            break
        case .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            ()
        }
    }
}

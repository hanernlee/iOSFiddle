//
//  ScaleSegue.swift
//  Card
//
//  Created by Christopher Lee on 25/4/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import UIKit

class ScaleSegue: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    
    func scale() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let viewController = fromViewController as? ViewController
        let oldFrame = viewController?.oldFrame
        
        containerView?.addSubview(toViewController.view)
        
        let initialFrame = oldFrame!
        let finalFrame = toViewController.view.frame
        
        let xScaleFactor = initialFrame.width / finalFrame.width
        let yScaleFactor = initialFrame.height / finalFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        toViewController.view.transform = scaleTransform
        toViewController.view.center = CGPoint(
            x: initialFrame.midX,
            y: initialFrame.midY
        )
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, animations: {
            toViewController.view.transform = CGAffineTransform.identity
            toViewController.view.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}

class UnwindScaleSegue: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    
    func scale() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let viewController = fromViewController as? CardInfoViewController
        let oldFrame = viewController?.oldFrame
        
        containerView?.addSubview(toViewController.view)
        
        let initialFrame = fromViewController.view.frame
        let finalFrame = oldFrame!
        
        let xScaleFactor = initialFrame.width / finalFrame.width
        let yScaleFactor = initialFrame.height / finalFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        toViewController.view.transform = scaleTransform
        toViewController.view.center = CGPoint(
            x: initialFrame.midX,
            y: initialFrame.midY
        )

        UIView.animate(withDuration: 0.7, animations: {
            toViewController.view.transform = CGAffineTransform.identity
            toViewController.view.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: nil)
    }
}

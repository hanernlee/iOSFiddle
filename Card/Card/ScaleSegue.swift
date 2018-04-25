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
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toViewController.view.transform = CGAffineTransform.identity
            toViewController.view.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
    
    func transformFromRect(from source: CGRect, toRect destination: CGRect) -> CGAffineTransform {
        return CGAffineTransform.identity
            .translatedBy(x: destination.midX - source.midX, y: destination.midY - source.midY)
            .scaledBy(x: destination.width / source.width, y: destination.height / source.height)
    }
}

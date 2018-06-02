//
//  InteractionPanToClose.swift
//  DesignCodeApp
//
//  Created by Christopher Lee on 2/6/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class InteractionPanToClose: UIPercentDrivenInteractiveTransition {

    @IBOutlet weak var viewController: UIViewController!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dialogView: UIView!
    
    var gestureRecognizer: UIPanGestureRecognizer!
    
    func setGestureRecognizer() {
        gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle))
        gestureRecognizer.delegate = self
        
        scrollView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handle(_ gesture: UIPanGestureRecognizer) {
        guard scrollView.contentOffset.y < 1 else { return }
        
        let threshold: CGFloat = 100.0
        let translation = gesture.translation(in: viewController.view)
        
        switch gesture.state {
        case .changed:
            let percentage = translation.y / 2000
            update(percentage)
            break
        case .ended:
            if translation.y > threshold {
                finish()
            } else {
                cancel()
            }
            break
        default:
            break
        }
    }
    
    override func update(_ percentComplete: CGFloat) {
        visualEffectView.alpha = 1 - percentComplete
        
        let translation = gestureRecognizer.translation(in: viewController.view)
        let translationY = CGAffineTransform(translationX: 0, y: translation.y)
        let scale = CGAffineTransform(scaleX: 1 - percentComplete, y: 1 - percentComplete)
        
        let origin = gestureRecognizer.location(in: viewController.view)
        let frameWidth = viewController.view.frame.width
        let originX = origin.x / frameWidth
        let degrees = 150 - originX * 300
        let rotationAngle = percentComplete * degrees * CGFloat.pi / 180
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        
        let transform = translationY.concatenating(scale).concatenating(rotation)
        dialogView.transform = transform
    }
    
    override func cancel() {
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.6)
        self.visualEffectView.alpha = 1
        self.dialogView.transform = .identity
        animator.startAnimation()
    }
    
    override func finish() {
        let animator = UIViewPropertyAnimator(duration: 0.9, dampingRatio: 0.9)
        self.dialogView.frame.origin.y += 200
        self.visualEffectView.effect = nil
        self.viewController.dismiss(animated: true)
        animator.startAnimation()
    }
}

extension InteractionPanToClose: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

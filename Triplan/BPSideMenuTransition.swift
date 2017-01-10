//
//  BPSideMenuTransition.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 11..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation
import UIKit

class BPSideMenuTransion: UIStoryboardSegue, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    override func perform() {
        destination.transitioningDelegate = self
        source.present(destination, animated: true) {
            self.destination.transitioningDelegate = nil
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        let offSetTransform = CGAffineTransform(translationX: toView.frame.size.width - 180, y: 0)
        let scaleTransform = offSetTransform.scaledBy(x: 0.6, y: 0.6)
        
        if let snapShot = fromView.snapshotView(afterScreenUpdates: true) {
            transitionContext.containerView.addSubview(toView)
            transitionContext.containerView.addSubview(snapShot)
            let duration = transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
                snapShot.transform = scaleTransform
            }) { _ in
                transitionContext.completeTransition(true)
            }
        } else {
            transitionContext.completeTransition(true)
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

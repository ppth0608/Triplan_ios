//
//  BPSideMenuUnwindTransition.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 11..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation
import UIKit

class BPSideMenuUnwindTransition: UIStoryboardSegue, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    override func perform() {
        source.transitioningDelegate = self
        destination.dismiss(animated: true, completion: nil)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        if let snapShot = toView.snapshotView(afterScreenUpdates: true) {
            snapShot.frame.origin = CGPoint(x: toView.frame.size.width - 80, y: 0)
//            snapShot.frame.size = CGSize(width: toView.frame.size.width * 0.6, height: toView.frame.size.height * 0.6)
            let offSetTransform = CGAffineTransform(translationX: -(toView.frame.size.width - 80), y: 0)
//            let scaleTransform = offSetTransform.scaledBy(x: 1.6, y: 1.6)
            
            fromView.addSubview(snapShot)
            let duration = transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: duration, animations: { 
                snapShot.transform = offSetTransform
            }) { _ in
                transitionContext.containerView.addSubview(toView)
                transitionContext.completeTransition(true)
            }
        } else {
            transitionContext.completeTransition(true)
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

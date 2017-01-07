//
//  BPCircleTransionUnwindSegue.swift
//  Pods
//
//  Created by Naver on 2017. 1. 6..
//
//

import Foundation
import UIKit

class BPCircleTransionUnwindSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    override func perform() {
        if let navigationController = source.navigationController {
            navigationController.transitioningDelegate = self
        } else {
            source.transitioningDelegate = self
        }
        destination.dismiss(animated: true, completion: nil)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
                return
        }
        
        fromView.superview?.insertSubview(toView, belowSubview: fromView)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(transitionDuration(using: transitionContext))
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setCompletionBlock {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionContext.view(forKey: .from)?.layer.mask = nil
        }
        
        var transitionCreateView: UIView!
        if let source = destination as? ViewControllerContainCircleTransition {
            transitionCreateView = source.circleTransitionTriggerView
        } else {
            transitionCreateView = UIView()
        }
        
        if let superView = transitionCreateView.superview {
            let beginFrame = transitionContext.initialFrame(for: fromViewController)
            let endFrame = toView.convert(transitionCreateView.frame, from: superView)
            let radius = max(beginFrame.width, beginFrame.height)
            
            let animation = CABasicAnimation(keyPath: "path")
            animation.fromValue = UIBezierPath(ovalIn: beginFrame.insetBy(dx: -radius, dy: -radius)).cgPath
            animation.toValue = UIBezierPath(ovalIn: endFrame.offsetBy(dx: 0, dy: 0)).cgPath
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            
            fromView.layer.mask = CAShapeLayer()
            fromView.layer.mask?.add(animation, forKey: "MaskAnimation")
        }
        
        CATransaction.commit()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

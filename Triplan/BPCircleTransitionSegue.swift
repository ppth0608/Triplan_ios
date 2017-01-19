//
//  BPCircleTransitionSegue.swift
//  Pods
//
//  Created by Naver on 2017. 1. 5..
//
//

import Foundation
import UIKit

class BPCircleTransitionSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    override func perform() {
        destination.transitioningDelegate = self
        source.present(destination, animated: true) {
            self.destination.transitioningDelegate = nil
        }
    }

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to),
            let toViewController = transitionContext.viewController(forKey: .to) else {
                return
        }

        transitionContext.containerView.addSubview(toView)

        CATransaction.begin()
        CATransaction.setAnimationDuration(transitionDuration(using: transitionContext))
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setCompletionBlock {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionContext.view(forKey: .to)?.layer.mask = nil
        }

        var transitionCreateView: UIView!
        if let source = source as? ViewControllerContainCircleTransition {
            transitionCreateView = source.circleTransitionTriggerView
        } else {
            transitionCreateView = UIView()
        }

        if let superView = transitionCreateView.superview {
            let beginFrame = fromView.convert(transitionCreateView.frame, from: superView)
            let endFrame = transitionContext.finalFrame(for: toViewController)
            let radius = max(endFrame.width, endFrame.height)

            let animation = CABasicAnimation(keyPath: "path")
            animation.fromValue = UIBezierPath(ovalIn: beginFrame.offsetBy(dx: 0, dy: 0)).cgPath
            animation.toValue = UIBezierPath(ovalIn: beginFrame.insetBy(dx: -radius, dy: -radius)).cgPath
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false

            toView.layer.mask = CAShapeLayer()
            toView.layer.mask?.add(animation, forKey: "MaskAnimation")
        }

        CATransaction.commit()
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

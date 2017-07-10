//
//  AnimationProvider.swift
//  AnimationDemo
//
//  Created by cocoawork on 2017/7/10.
//  Copyright © 2017年 cocoawork. All rights reserved.
//

import UIKit

enum OperationType {
    case In
    case Out
    case Push
    case Pop
}


class AnimationProvider: NSObject {

    var operationType: OperationType!
    
}

extension AnimationProvider: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        let fromView = fromVC?.view
        let toView = toVC?.view
        
        fromView?.clipsToBounds = true
        toView?.clipsToBounds = true
        //进入动画
        if operationType == .In {
            toView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: 50)
            containerView.addSubview(toView!)
            toView?.center = containerView.center
            UIView.transition(with: toView!,
                              duration: self.transitionDuration(using: transitionContext),
                              options: UIViewAnimationOptions.curveEaseIn,
                              animations: {
                                toView?.frame = UIScreen.main.bounds
            }) { (ifFinished) in
                transitionContext.completeTransition(true)
            }
        }
        
        if operationType == .Out {
            containerView.insertSubview(toView!, belowSubview: fromView!)
            UIView.transition(with: fromView!,
                              duration: self.transitionDuration(using: transitionContext),
                              options: UIViewAnimationOptions.curveEaseOut,
                              animations: { 
                                fromView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: 50)
            }, completion: { (isFinished) in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            })
            
        }
        
        if operationType == .Push {
            toView?.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            containerView.addSubview(toView!)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext) + 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 0.3,
                           options: UIViewAnimationOptions.curveEaseIn,
                           animations: { 
                            toView?.frame = UIScreen.main.bounds
            }, completion: { (isFinished) in
                transitionContext.completeTransition(true)
            })
        }
        
        if operationType == .Pop {
            containerView.insertSubview(toView!, belowSubview: fromView!)
            
            let transform1 = CATransform3DMakeScale(0.01, 0.01, 0.01)
            let transform2 = CATransform3DRotate(transform1, CGFloat(Double.pi), 0, 0, 1)
            
            
            UIView.transition(with: fromView!,
                              duration: 0.5,
                              options: UIViewAnimationOptions.curveEaseOut,
                              animations: { 
                                fromView?.layer.transform = CATransform3DConcat(transform1, transform2)
            }, completion: { (isFinished) in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            })
        }
        
        
    }
    
}


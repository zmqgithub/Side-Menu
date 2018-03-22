//
//  FrameTransition.swift
//  SideMenu
//
//  Created by ODA on 22/03/18.
//  Copyright © 2018 ODA. All rights reserved.
//

import UIKit

class FrameTransition: NSObject {
    var frame = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            frame.center = startingPoint
        }
    }
    
    var frameColor = UIColor.white
    
    var duration = 0.5
    
    enum FrameTransitionMode:Int {
        case present, dismiss, pop
    }
    
    var transitionMode:FrameTransitionMode = .present
}

extension FrameTransition: UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
         if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewSize = presentedView.frame.size
                
                presentedView.frame = CGRect(x: -viewSize.width, y: 0, width: viewSize.width, height: viewSize.height)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    presentedView.alpha = 1
                    presentedView.frame = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
                }, completion: { (success:Bool) in
                    transitionContext.completeTransition(success)
                })
            }
         }else{
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                UIView.animate(withDuration: duration, animations: {
                    returningView.frame = CGRect(x: -viewSize.width, y: 0, width: viewSize.width, height: viewSize.height)
                    returningView.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                    }
                    
                    
                }, completion: { (success:Bool) in
                    returningView.center = viewCenter
                    returningView.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
            }
        }
    }
    
    
}

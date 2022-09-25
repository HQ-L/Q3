//
//  AnimationTransition.swift
//  PracticeNavigationController
//
//  Created by hq on 2022/9/24.
//


import UIKit

class AnimationTransition: NSObject {

    private var checkPresentOrDismiss = true

    init(checkPresentOrDismiss: Bool) {
        self.checkPresentOrDismiss = checkPresentOrDismiss
        super.init()
    }

}

extension AnimationTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        animateForGradient(using: transitionContext)
    }

    func animateForGradient(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let fromVCView = fromVC.view else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        guard let toVCView = toVC.view else { return }
        let containerView = transitionContext.containerView
        containerView.addSubview(fromVCView)
        containerView.addSubview(toVCView)
        toVCView.alpha = 0.0
        fromVCView.alpha = 1.0

        UIView.animate(withDuration: 0.5, animations: {
            fromVCView.alpha = 0.0
            toVCView.alpha = 1.0
        }, completion: { (complete) in
            toVCView.isHidden = false
            fromVCView.isHidden = false
            transitionContext.completeTransition(complete)
        })
    }
}

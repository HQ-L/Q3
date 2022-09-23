//
//  AnimationTransition.swift
//  ModalTransition
//
//  Created by hq on 2022/9/23.
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
        if checkPresentOrDismiss {
            animateForPresent(using: transitionContext)
        } else {
            animateForDismiss(using: transitionContext)
        }
    }

    func animateForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let fromVCView = fromVC.view else { return }
        guard let snapShotFromVC = fromVCView.snapshotView(afterScreenUpdates: true) else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        guard let toVCView = toVC.view else { return }
        guard let snapShotToVC = toVCView.snapshotView(afterScreenUpdates: true) else { return }
        let containerView = transitionContext.containerView
        containerView.addSubview(snapShotToVC)
        containerView.addSubview(snapShotFromVC)
        containerView.addSubview(toVCView)
        toVCView.isHidden = true
        fromVCView.isHidden = true
        snapShotToVC.alpha = 0.0
        snapShotFromVC.alpha = 1.0

        UIView.animate(withDuration: 0.5, animations: {
            snapShotToVC.alpha = 1.0
            snapShotFromVC.alpha = 0.0
        }, completion: { (complete) in
            snapShotFromVC.removeFromSuperview()
            snapShotToVC.removeFromSuperview()
            toVCView.isHidden = false
            fromVCView.isHidden = false
            transitionContext.completeTransition(complete)
        })
    }

    func animateForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let fromVCView = fromVC.view else { return }
        guard let snapShotFromVC = fromVCView.snapshotView(afterScreenUpdates: true) else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        guard let toVCView = toVC.view else { return }
        guard let snapShotToVC = toVCView.snapshotView(afterScreenUpdates: true) else { return }
        let containerView = transitionContext.containerView
        containerView.addSubview(snapShotToVC)
        containerView.addSubview(snapShotFromVC)
        snapShotToVC.alpha = 0.0
        snapShotFromVC.alpha = 1.0
        toVCView.isHidden = true
        fromVCView.isHidden = true

        UIView.animate(withDuration: 0.5, animations: {
            snapShotToVC.alpha = 1.0
            snapShotFromVC.alpha = 0.0
        }, completion: { (complete) in
            snapShotFromVC.removeFromSuperview()
            snapShotToVC.removeFromSuperview()
            toVCView.isHidden = false
            transitionContext.completeTransition(complete)
        })
    }
}

//
//  ViewController.swift
//  ModalTransition
//
//  Created by hq on 2022/9/22.
//

import UIKit

class ViewController: UIViewController {

    private var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPresentButton()
    }


}

private extension ViewController {

    func setupPresentButton() {
        view.addSubview(presentButton)
        presentButton.frame.size = CGSize(width: 100, height: 100)
        presentButton.setTitle("present", for: .normal)
        presentButton.center = view.center
        presentButton.backgroundColor = .blue
        presentButton.layer.cornerRadius = 10
        presentButton.addTarget(self, action: #selector(pressPresentButtonAction), for: .touchUpInside)
    }

    @objc func pressPresentButtonAction() {
        let toVC = SecondViewController()
        toVC.modalPresentationStyle = .overFullScreen
        toVC.transitioningDelegate = self
        present(toVC, animated: true)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationTransition(checkPresentOrDismiss: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationTransition(checkPresentOrDismiss: false)
    }
}

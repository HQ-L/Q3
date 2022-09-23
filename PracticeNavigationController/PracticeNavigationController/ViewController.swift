//
//  ViewController.swift
//  PracticeNavigationController
//
//  Created by hq on 2022/9/23.
//

import UIKit

class ViewController: UIViewController {

    private var jumpToSecondVCButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPresentButton()
    }

    func setupPresentButton() {
        view.addSubview(jumpToSecondVCButton)
        jumpToSecondVCButton.frame.size = CGSize(width: 100, height: 100)
        jumpToSecondVCButton.setTitle("present", for: .normal)
        jumpToSecondVCButton.center = view.center
        jumpToSecondVCButton.backgroundColor = .blue
        jumpToSecondVCButton.layer.cornerRadius = 10
        jumpToSecondVCButton.addTarget(self, action: #selector(pressPresentButtonAction), for: .touchUpInside)
    }

    @objc func pressPresentButtonAction() {
        let toVC = SecondViewController()
        self.navigationController?.pushViewController(toVC, animated: true)
    }

}


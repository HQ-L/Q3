//
//  SecondViewController.swift
//  PracticeNavigationController
//
//  Created by hq on 2022/9/23.
//


import UIKit

class SecondViewController: UIViewController {

    private var showLabel = UILabel()
    private var dismissButtton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupShowLabel()
        setupdismissButton()
    }
}

private extension SecondViewController {

    func setupShowLabel() {
        view.addSubview(showLabel)
        showLabel.frame.size = CGSize(width: 200, height: 50)
        showLabel.center = view.center
        showLabel.text = "这是第二个页面"
        showLabel.textAlignment = .center
        showLabel.backgroundColor = .orange
    }

    func setupdismissButton() {
        view.addSubview(dismissButtton)
        dismissButtton.frame.size = CGSize(width: 100, height: 100)
        dismissButtton.center = CGPoint(x: view.center.x, y: view.center.y + 80)
        dismissButtton.setTitle("dismiss", for: .normal)
        dismissButtton.backgroundColor = .black
        dismissButtton.addTarget(self, action: #selector(pressDissmissButtonAction), for: .touchUpInside)
    }

    @objc func pressDissmissButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

# 从相册App优雅的浅谈iOS转场动画

[TOC]

## iOS动画简介

&emsp;在iOS中在进行页面转场时候有很多的方式，可以通过present的方式直接进行模态的页面转场，也可通过将页面通过NavigationController去管理，进行页面转场，在默认的情况下，iOS为这些动画都制作了比较优雅的动画，但是在某些时候，为了使动画更加优雅，我们就需要对具体的动画进行重构，以达到我们想要达到的表现形式。

## 各类动画基础实现形式

- model转场的基础实现形式

  这种转场方式的实现在代码层面上是比较简单，我们只需要去写的页面使用present和dismiss即可进行跳转，具体实现效果如下：

  ![image](./modal1.gif)

  图中展示的是点击按钮以modal的方式进行转场，进入到下一个页面，然后下一个页面进行下滑操作回到上一个页面，当然这种方式不是唯一的返回页面的方法，而且需要我们去拖动页面来返回，不够优雅，所以在这个demo中，我将第二个页面做了一个按钮进行返回页面的操作，按下按钮即可触发，如下为两个页面的具体代码。

    ```swift
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
            present(toVC, animated: true)
        }
    }
    ```

    ```swift
    //
    //  SecondViewController.swift
    //  ModalTransition
    //
    //  Created by hq on 2022/9/22.
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
            dismiss(animated: true)
        }
    }

    ```

- 使用UINavigationController来实现页面转场

## 具体实现代码（以Modal转场和UINavigationController转场为例）

### Modal转场动画重构

### UINavigationController转场动画重构

## 总结

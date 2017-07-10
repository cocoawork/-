//
//  ViewController.swift
//  AnimationDemo
//
//  Created by cocoawork on 2017/7/10.
//  Copyright © 2017年 cocoawork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var storyBoard: UIStoryboard!
    var animationProvider: AnimationProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        self.animationProvider = AnimationProvider()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self)---\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self)---\(#function)")
    }
    
    
    @IBAction func startPresentAnimation(_ sender: UIButton) {
        //present动画
        
        let toVC = storyBoard.instantiateViewController(withIdentifier: "ViewController2")
        toVC.transitioningDelegate = self
        self.present(toVC, animated: true, completion: nil)
    }

    @IBAction func startPushAnimation(_ sender: UIButton) {
        //push动画
        let toVC = storyBoard.instantiateViewController(withIdentifier: "ViewController3")
        self.navigationController?.delegate = self
        self.navigationController?.pushViewController(toVC, animated: true)
    }

    
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationProvider.operationType = .In
        return animationProvider
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationProvider.operationType = .Out
        return animationProvider
    }
}


extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            animationProvider.operationType = .Push
        }
        if operation == .pop {
            animationProvider.operationType = .Pop
        }
        return animationProvider
    }
}

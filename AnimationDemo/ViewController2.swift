//
//  ViewController2.swift
//  AnimationDemo
//
//  Created by cocoawork on 2017/7/10.
//  Copyright © 2017年 cocoawork. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.value(forKeyPath: "isa")!)---\(#function)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self.value(forKeyPath: "isa")!)---\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self.value(forKeyPath: "isa")!)---\(#function)")
    }
    

    @IBAction func startDismissAnimation(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

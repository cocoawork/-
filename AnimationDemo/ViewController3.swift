//
//  ViewController3.swift
//  AnimationDemo
//
//  Created by cocoawork on 2017/7/10.
//  Copyright © 2017年 cocoawork. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

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
    

    @IBAction func startPopAnimation(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

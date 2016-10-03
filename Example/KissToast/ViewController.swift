//
//  ViewController.swift
//  KissToast
//
//  Created by WANG Jie on 10/03/2016.
//  Copyright (c) 2016 WANG Jie. All rights reserved.
//

import UIKit
import KissToast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showToast(_ sender: AnyObject) {
        Toast.Builder(text: "This is a toast").duration(1).build().show()
    }

}


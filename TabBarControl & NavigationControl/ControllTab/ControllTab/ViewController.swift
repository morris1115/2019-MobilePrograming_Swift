//
//  ViewController.swift
//  ControllTab
//
//  Created by 한림1111 on 2019. 11. 13..
//  Copyright © 2019년 hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any addit/Users/hallym1111/Desktop/ControllTab/ControllTab/ImageViewController.swiftional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func lampbtn(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func mapbtn(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    

}


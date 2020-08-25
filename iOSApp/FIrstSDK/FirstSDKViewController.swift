//
//  FirstSDKViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/24.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class FirstSDKViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func onClick1(_ sender: Any) {
        self.view.backgroundColor = UIColor.red;
    }
    @IBAction func onClick2(_ sender: Any) {
        self.view.backgroundColor = UIColor.blue;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello SDK"
    }
}

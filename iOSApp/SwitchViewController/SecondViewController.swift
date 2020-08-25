//
//  SecondViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var lblText: UILabel!
    
    //문자열 변수
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if data != nil{
            lblText.text = data
        }

    }
    
    @IBAction func back(_ sender: Any) {
        //이전 뷰 컨트롤러로 돌아가기
        self.presentingViewController?.dismiss(animated: true)
        
//        let viewController = presentingViewController as! SwitchViewController
//        viewController.lblMsg.text = "첫번째 뷰 컨트롤러"
//        viewController.dismiss(animated: true)
    }
    
}

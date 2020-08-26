//
//  LinkViewController.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/26.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit
import WebKit

class LinkViewController: UIViewController {
    
    //상위 뷰 컨트롤러부터 넘겨주는 데이터를 저장할 변수
    var link : String!
    
    @IBOutlet var webview: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //문자열 주소 -> URL -> URLRequest
        let url = URL(string: link)
        let urlRequest = URLRequest(url: url!)
        webview.load(urlRequest)
    }
}

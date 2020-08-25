//
//  AttractionSubViewController.swift
//  iOSPortfolio
//
//  Created by 304 on 2020/08/24.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

import WebKit

class AttractionSubViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    //Main으로부터 넘겨받을 데이터를 저장할 변수
    var link : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //link의 내용을 웹 뷰에 출력
        //if 나 guard 문장에서 변수나 상수를 생성해서 대입하면
        //대입되는 nil이면 false를 리턴하고 nil이 아니면 true를 리턴
        NSLog(link)
        if let addr = link{
            let webURL = URL(string:addr)
            let urlRequest = URLRequest(url: webURL!)
            webView.load(urlRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

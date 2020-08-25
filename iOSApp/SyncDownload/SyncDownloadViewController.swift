//
//  SyncDownloadViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class SyncDownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

            //텍스트를 다운로드 받아서 TextView에 출력
            let tv = UITextView(frame:CGRect(x:0, y:400, width:320, height:300))
            //동기적 다운로드
            let naverUrl = "https://www.naver.com"
            let url = URL(string:naverUrl)
            //예외처리를 강제하는 코드에서 try! 를 붙이면 예외처리를 하지 않아도 됩니다.
            let naverData = try! Data(contentsOf:url!)
            //문자열로 변환해서 tv에 출력
            let naverString = String(data:naverData, encoding:.utf8)
            tv.text = naverString
            
            //텍스트 뷰를 현재 뷰 컨트롤러의 뷰에 추가
            self.view.addSubview(tv)
            
            let imageView = UIImageView(frame:CGRect(x:0, y:0, width:320, height:400))
            
            let imgAddr = "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB18aMMO.img"
            let imgUrl = URL(string:imgAddr)
            let imgData = try! Data(contentsOf:imgUrl!)
            
            let image = UIImage(data : imgData)
            imageView.image = image
            
            self.view.addSubview(imageView)
    }

}

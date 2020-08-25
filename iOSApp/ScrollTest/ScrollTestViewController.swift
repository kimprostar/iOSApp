//
//  ScrollTestViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/24.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class ScrollTestViewController: UIViewController {
    
    var imageView:UIImageView!
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIImage 객체 생성
        let image = UIImage(named: "large.jpg")
        //이미지를 가지고 이미지 뷰를 생성
        imageView = UIImageView(image: image)
        //뷰에 출력
        //self.view.addSubview(imageView)
        
        //스크롤 뷰 생성 - 현재 디바이스의 크기와 동일하게
        scrollView = UIScrollView(frame: UIScreen.main.bounds)
        //스크롤 뷰는 contentSize를 설정해야 함
        scrollView.contentSize = imageView.frame.size
        //스크롤 가능하도록 설정
        scrollView.isScrollEnabled = true
        //이미지 뷰를 스크롤 뷰에 배치하고 스크롤 뷰를
        //현재 뷰 컨트롤러의 뷰에 배치
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        scrollView.bounces = false
        
        //최대 최소 확대 배율을 설정
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 0.5
        //delegate 설정
        scrollView.delegate = self
        
    }

}

//클래스 기능 확장
extension ScrollTestViewController:UIScrollViewDelegate{
    //실제 줌이 발생할 뷰를 설정하는 메소드
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

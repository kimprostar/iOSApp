//
//  AsyncViewController.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/27.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit
import Alamofire

class AsyncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Alamofire를 이용한 다운로드
        let r = AF.request("https://httpbin.org/get", method:.get, parameters: nil)
        r.response {
            response in
            let msg = String(bytes: response.data!, encoding: .utf8)
            NSLog(msg!)
        }
        
        
        //비동기 방식으로 문자열 다운로드 - GET
        
        //1.세션 생성
        let session = URLSession.shared
        
        //2.task 생성
        let task = session.dataTask(with: URL(string: "http://cyberadam.cafe24.com/movie/list?page=\(1)")!, completionHandler: {(data:Data?, response:URLResponse?, error:Error?) -> Void in
            
            //에러가 발생하면
            if error != nil{
                NSLog("다운로드 에러:\(error!.localizedDescription)")
            }else{
                //NSLog("다운로드 받은 데이터:\(data!)")
                
                //문자열로 변환해서 출력
                //let str = String(bytes: data!, encoding: .utf8)
                //NSLog("다운로드 받은 데이터:\(str!)")
                
                //JSONParsing 까지 수행
                let result = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                NSLog("다운로드 받은 데이터:\(result.description)")
                
            }
        })
        //3.task 실행
        task.resume()
        
        //이미지 뷰를 생성해서 배치
        
        //1.전체 화면 크기 가져오기
        let frame = UIScreen.main.bounds
        //2.UIImageView 객체 생성
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width/2, height: frame.size.height/2))
        //3.위치 설정
        imageView.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        //4.현재 뷰 위에 추가
        self.view.addSubview(imageView)
        
        let imageTask = session.dataTask(with: URL(string:"http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG")!, completionHandler: {(data:Data?, response:URLResponse?, error:Error?) -> Void in
            
            let image = UIImage(data: data!)
            OperationQueue.main.addOperation {
                imageView.image = image
            }
        })
        imageTask.resume()
        
        //POST 방식으로 전송하기 위한 URLRequest를 생성하고 POST를 설정
        let url = URL(string:"http://cyberadam.cafe24.com/member/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        //파라미터 생성
        let parameter = "email=root&pw=1234"
        //파라미터 설정
        request.httpBody = parameter.data(using: .utf8)
        
        let task2 = session.dataTask(with: request){
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
            let result = String(data: data!, encoding: .utf8)
            NSLog(result!)
        }
        task2.resume()
    }
}

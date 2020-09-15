//
//  ItemListViewController.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/27.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit
import Alamofire
import Nuke

class ItemListViewController: UITableViewController {
    //테이블 뷰에 출력할 데이터 배열 - 파싱 결과 저장
    //var list = Array<Item>()
    
    //Closure를 이용한 지연 생성
    //지연 생성 - 인스턴스가 생성될 때 생성하지 않고 처음으로 사용될 때 생성하는 객체 지향의 프로퍼티 생성 방식
    lazy var list : [Item] = {
        var imsi = [Item]()
        return imsi
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ITEM"
        
        //다운로드 받을 주소
        let url = "http://cyberadam.cafe24.com/item/list"
        
        //JSON 데이터 가져오기
        //headers 는 일반 파라미터가 아닌 파라미터가 있을 때 사용
        //{(파라미터) -> 결과형 in 내용}
        //{파라미터 in 내용}
        //파라미터가 1개인 경우는 () 생략 가능
        //리턴 타입이 Void 인 경우 -> 결과형 생략 가능
        let request = AF.request(url, method:.get, encoding:JSONEncoding.default, headers:[:])
        //요청을 전송하고 응답을 받아오기
        request.responseJSON{
            (response) -> Void in
            //가져온 데이터는 response.value
            //여기까지 작성하고 실행했는데 에러가 나면 URL을 확인하고 URL이 http로 시작하면
            //Info.plist 파일에 ATS 설정이 되어 있는지 확인
            
            //결과 데이터가  JSON 이 맞는지 확인
            //NSLog("\(response.value!)")
            
            //시작이 { 이므로 NSDictionary 로 변환
            //[String : Any] 도 NSDictionary
            if let jsonObject = response.value as? [String:Any]{
                //list 키의 데이터를 배열로 가져오기
                let list = jsonObject["list"] as! NSArray
                //배열의 순회
                for index in 0...(list.count - 1){
                    //배열안의 객체를 인덱스를 이용해서 가져오기
                    let item = list[index] as! NSDictionary
                    //파싱한 결과를 저장하기 위한 객체를 생성
                    var obj = Item(
                        itemid: (item["itemid"] as! NSNumber).intValue,
                        itemname: item["itemname"] as! String,
                        price: (item["price"] as! NSNumber).intValue,
                        description: item["description"] as! String,
                        pictureurl: item["pictureurl"] as! String,
                        image: nil
                    )
                    //pictureurl을 이용해서 이미지 다운로드
                    let url:URL! = URL(string:"http://cyberadam.cafe24.com/img/\(obj.pictureurl!)")
                    let imageData = try! Data(contentsOf: url)
                    //다운로드 받은 이미지를 설정
                    obj.image = UIImage(data:imageData)
                    
                    //배열에 추가
                    self.list.append(obj)
                    
                }
                //테이블 뷰를 재출력
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
                                                                
        //하나의 행에 해당하는 데이터를 찾아오기
        let item = list[indexPath.row]
        //세부 내용 출력
        //cell!.imageView!.image = item.image
        //Nuke를 이용해서 이미지 출력
        DispatchQueue.main.async(execute: {() -> Void in
            //다운로드 받을 주소 생성
            let url = URL(string:"http://cyberadam.cafe24.com/img/\(item.pictureurl!)")
            //옵션 설정
            let options = ImageLoadingOptions(placeholder: UIImage(named:"car00.jpg"), transition: .fadeIn(duration: 10))
            //Nuke 설정
            Nuke.loadImage(with: url!, options: options, into:cell!.imageView!)
        })
        
        cell!.textLabel!.text = item.itemname
        cell!.detailTextLabel!.text = "\(item.description!) \(item.price!)원"

        return cell!
    }
    
}


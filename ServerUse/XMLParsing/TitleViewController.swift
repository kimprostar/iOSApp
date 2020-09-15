//
//  TitleViewController.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/26.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class TitleViewController: UITableViewController {
    
    //파싱 결과를 저장할 배열 - 이 배열의 데이터가 테이블 뷰에 출력
    var haniList = Array<Hani>()
    //파싱 도중에 사용할 임시 변수를 생성
    var hani : Hani!
    var content : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //타이틀 설정
        self.title = "한겨레"
        
        //파싱할 URL을 생성
        let url = URL(string:"http://www.hani.co.kr/rss/")
        //URL의 데이터를 파싱하는 객체를 생성
        let xmlParser = XMLParser(contentsOf: url!)
        //파싱 시작
        xmlParser?.delegate = self
        xmlParser?.parse()

    }

    //테이블 뷰 출력 관련 메소드
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haniList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        //데이터 찾아오기
        let temp = haniList[indexPath.row]
        cell!.textLabel!.text = temp.title
        cell!.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //행 번호에 해당하는 데이터 찾기
        let temp = haniList[indexPath.row]
        //하위 뷰 컨트롤러 객체 생성
        let linkViewController = self.storyboard?.instantiateViewController(withIdentifier: "linkViewController") as! LinkViewController
        //데이터 넘겨주기
        linkViewController.link = temp.link
        //푸시
        self.navigationController?.pushViewController(linkViewController, animated: true)
    }
}

//XMLParsing을 위한 extension(클래스의 기능을 확장하기 위한 개념)
//각 프로토콜의 conform하는 메소드를 별도로 분리해서 구현하면 가독성이 높아집니다.
extension TitleViewController : XMLParserDelegate{
    //하나의 객체를 의미하는 태그가 item 이고 임시변수가 hani
    //실제 저장할 속성은 title, link
    
    //태그가 열릴 때 호출되는 메소드
    //elementName 이 태그 이름이고
    //attributeDict 가 모든 속성을 저장할 NSDictionary
    func parser(_ parser:XMLParser, didStartElement elementName:String, namespaceURI:String?, qualifiedName qName:String?, attributes attributeDict:[String:String] = [:]){
        //임시 객체의 메모리 할당을 하고 속성을 읽는 작업을 수행
        
        if elementName == "item"{
            hani = Hani()
        }
        
    }
    
    
    
    //태그 안의 내용을 만났을 때 호출되는 메소드
    //foundCharacters 가 태그 안의 문자열
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //태그 안의 내용을 임시 변수에 저장
        content = string
    }
    
    //태그가 닫힐 때 호출되는 메소드
    func parser(_ parser:XMLParser, didEndElement elementName:String, namespaceURI:String?, qualifiedName qName:String?){
        //세부 속성인 경우에는 임시 객체의 각 프로퍼티에 데이터를 저장하고
        //객체에 해당하는 태그이면 이 경우는 객체를 배열에 저장
        
        //하나의 객체를 닫는 태그가 나온 경우는 객체를 배열에 저장
        //객체를 초기화
        if elementName == "item"{
            haniList.append(hani)
            hani = nil
        }
        //저장하고자 하는 속성 태그가 나오는 경우에는 앞에서 읽은 내용을
        //각 속성에 저장하면 됩니다.
        else if elementName == "title"{
            if hani != nil{
                hani.title = content
            }
        }else if elementName == "link"{
            if hani != nil{
                hani.link = content
            }
        }
        
    }
}

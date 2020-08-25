//
//  SocketClientViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class SocketClientViewController: UIViewController {

    //서버 주소를 위한 변수
    let host = "192.168.0.200"
    let port = 9999
    //클라이언트 소켓 변수
    var client : TCPClient?
    
    
    @IBAction func send(_ sender: Any) {
        //Client 소켓 생성
        guard let client = client else {return}
        
        switch client.connect(timeout: 60) {
        case .success:
            appendToTextView(string: "접속 성공")
            if let response = sendRequest(string: "\(tfMsg.text!)\n\n", using: client){
                appendToTextView(string: response)
            }
        default:
            appendToTextView(string: "접속 실패")
        }
        
    }
    @IBOutlet weak var tfMsg: UITextField!
    
    @IBOutlet weak var tvResult: UITextView!
    
    //문자열을 받아서 문자열을 텍스트 뷰에 출력하는 메소드
    func appendToTextView(string:String){
        tvResult.text = tvResult.text.appending("\(string)\n")
    }
    
    //요청의 결과를 읽어오는 메소드
    func readResponse(from client:TCPClient) -> String?{
        //서버와 클라이언트는 받는 부분과 보내는 부분이 스레드로 구현되어야 합니다.
        //스레드로 구현하지 않은 상태에서 이 방식으로 구현을 하면 클라이언트가 전송한 내용은 서버에게 전달되지만 서버가 보낸 내용은 클라이언트가 읽을 수가 없습니다.
        //서버가 보내면 조금 기다렸다가 읽기 위해서 sleep 을 설정한 것입니다.
        //소켓 통신을 할 때 반드시 알아야 두어야 할 것 중의 하나가 보내는 부분과 받는 부분이 별도의 스레드로 구현되어야 한다는 것입니다.
        sleep(3)
        //if 나 guard 안에서 변수를 만들어서 대입하면 변수의 값이 nil 이면 false를 리턴하고 그렇지 않으면 true
        //nil 인지 확인하는 문장 대신에 이런 형태의 문장 많이 사용
        //변수명 = 코드 ?? 기본값 - 코드가 nil 이면 기본값을 설정
        guard let response = client.read(1024*10) else{
            return nil
        }
        return String(bytes: response, encoding: .utf8)
    }
    
    //요청을 전송하는 메소드
    func sendRequest(string:String, using client:TCPClient) -> String?{
        appendToTextView(string: "데이터 전송")
        
        switch client.send(string:string){
        case .success:
            //응답을 출력하는 메소드를 호출
            return readResponse(from:client)
        case .failure(let error):
            appendToTextView(string: String(describing: error))
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        client = TCPClient(address:host, port:Int32(port))
    }

}


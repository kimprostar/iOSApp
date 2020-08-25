//
//  SwitchViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    
    @IBOutlet var lblMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: Any) {
        //secondViewController 객체 생성
        var secondViewController = self.storyboard?.instantiateViewController(identifier: "svc") as! SecondViewController
        
        //애니메이션 설정 - 반대로 돌아올때도 적용 됨
        secondViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        secondViewController.data = "두번째 뷰 컨트롤러"
        
        //출력
        self.present(secondViewController, animated: true)
    }
    
    //세그웨이를 이용해서 이동하는 경우 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이의 목적지가 되는 뷰 컨트롤러 가져오기
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.data = "세그웨이를 이용한 이동"
    }
    
    //세그웨이를 이용해서 돌아올 대 호출될 메소드
    //이 메소드의 이름은 아무런 의미가 없다.
    //이 메소드와 동일한 모양의 메소드는 있으면 안됨
    @IBAction func returned(segue:UIStoryboardSegue){
        lblMsg.text = "세그웨이를 이용해서 돌아옴"
    }
    
}

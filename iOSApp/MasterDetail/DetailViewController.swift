//
//  DetailViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    //프로퍼티의 값을 감시하고 있다가 프로퍼티의 값이 변경이 되면
    //didSet 안의 코드를 호출
    //setter 메소드에는 매개변수의 값을 받아서 인스턴스 변수에 대입하는 코드가 작성되지만 값이 변경되기 전이나 변경 된 후에 수행해야 할 내용이 있으면 작성해두면 별도로 View를 업데이트하지 않아도 됩니다.
    //데이터베이스에서는 트리거를 이용해서 DML 작업할 때 다른 테이블에 작업을 수행하도록 하고 로그인이나 로그아웃 작업할 때 내용을 로그파일에 작성한다던가 하는 작업을 합니다.
    //로그 테이블을 만들어서 로그인을 한 시간이나 로그아웃을 기록해두어야 합니다.
    var detailItem: NSDate? {
        didSet {
            configureView()
        }
    }


}

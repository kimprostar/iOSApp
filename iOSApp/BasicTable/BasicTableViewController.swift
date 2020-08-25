//
//  BasicTableViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class BasicTableViewController: UIViewController {
    
    var data = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainSize = UIScreen.main.bounds.size
        //UITableView 객체를 생성해서 출력 준비를 하고
        //현재 뷰 컨트롤러의 뷰 위에 추가
        let table = UITableView(frame:CGRect(x:0,y:0,width:mainSize.width,height:mainSize.height))
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        //테이블 뷰에 출력할 데이터 배열을 생성
        data = ["하성운", "하떵웅", "하셍언", "하트하씨", "하하하", "하댕댕"]

    }


}

extension BasicTableViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cellIdentifier = "Cell";
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if (cell == nil)
            {
                cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle,reuseIdentifier:cellIdentifier)
            }
            cell!.imageView!.image = UIImage(named: "blue\(indexPath.row).jpg")
            cell!.textLabel!.text = data[indexPath.row]
            if indexPath.row == 3{
                cell!.detailTextLabel!.text = "강아지"
            }else{
                cell!.detailTextLabel!.text = "댕댕이";
            }
            return cell!
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.row];
        let alert = UIAlertController(title: "선택된 항목", message: selectedItem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        // 버튼을 컨트롤러에 등록
        alert.addAction(ok)
        // 메시지창 실행
        self.present(alert, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 100;
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt: IndexPath) -> Int{
        return indentationLevelForRowAt.row % 2;
    }

}

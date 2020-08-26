//
//  RootTableViewController.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    //테이블 뷰에 출력할 제목과 하위 제목 배열을 생성
    var titles = Array<String>()
    var subtitles = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "서버 연동 & 로컬 저장"
        
        titles.append("XML Parsing")
        subtitles.append("한겨레 신문사 RSS 출력")
    
    }
    
    


    // MARK: - Table view data source
    // 섹션의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 섹션 별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    // 각 섹션의 행에 해당하는 부분의 셀을 설정하는 부분
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }

        cell!.textLabel!.text = titles[indexPath.row]
        cell!.detailTextLabel!.text =
            subtitles[indexPath.row]
        cell!.accessoryType = .disclosureIndicator

        return cell!
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let titleViewController = self.storyboard?.instantiateViewController(withIdentifier: "titleViewController") as! TitleViewController
            self.navigationController?.pushViewController(titleViewController, animated: true)
        }
    }
}

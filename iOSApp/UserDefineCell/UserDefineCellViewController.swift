//
//  UserDefineCellViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/08/25.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit

class UserDefineCellViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ar:Array<Dictionary<String, String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        let dic1 = ["name":"하성운", "skill":"하늘 사랑하기", "imageName":"green0.jpg"]
        let dic2 = ["name":"하댕댕", "skill":"귀여움", "imageName":"green1.jpg"]
        let dic3 = ["name":"하떵웅", "skill":"노래", "imageName":"green2.jpg"]
        let dic4 = ["name":"하구름", "skill":"댄스", "imageName":"green3.jpg"]
        let dic5 = ["name":"하하하", "skill":"영어, 플롯", "imageName":"green4.jpg"]
        let dic6 = ["name":"하셍", "skill":"일본어", "imageName":"green5.jpg"]
        
        ar = [dic1, dic2, dic3, dic4, dic5, dic6]
        
    }
    
    
}

extension UserDefineCellViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ar.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CustomCell"
        var cell : CustomTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as? CustomTableViewCell
        
        var dic = ar[indexPath.row]
        print(dic)
        
        cell!.lblName!.text = dic["name"]
        cell!.lblSkill!.text = dic["skill"]
        cell!.imgView!.image = UIImage(named:dic["imageName"]!)
        return cell!;
    }
}

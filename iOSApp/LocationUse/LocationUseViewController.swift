//
//  LocationUseViewController.swift
//  iOSApp
//
//  Created by EUNJUNG KIM on 2020/09/14.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import UIKit
import CoreLocation

class LocationUseViewController: UIViewController{
    
    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblAltitude: UILabel!
    @IBOutlet var lblDistance: UILabel!
    
    //위치 정보 사용을 위한 객체를 생성
    var locationManager:CLLocationManager = CLLocationManager()
    //시작위치를 저장할 변수를 선언
    var startLocation : CLLocation!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //정밀도 설정
        locationManager.desiredAccuracy =
            kCLLocationAccuracyBest
        //delegate 설정
        locationManager.delegate = self
        //위치정보 사용 여부 설정 - 실행 중에만 사용
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    @IBAction func locationInfo(_ sender: Any) {
        //이벤트가 발생한 객체 찾아오기
        let btn = sender as! UIButton
        //버튼의 타이틀에 따라 다른 동작
        if btn.title(for: .normal) == "위치정보 수집 시작" {
            btn.setTitle("위치정보 수집 종료", for: .normal)
        }else{
            btn.setTitle("위치정보 수집 시작", for: .normal)
        }
    }
    

}

extension LocationUseViewController: CLLocationManagerDelegate {
    //위치정보가 갱신되었을 때 호출되는 메소드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //가장 마지막에 저장된 위치 정보 가져오기
        let latestLocation = locations[locations.count - 1]
        //위치 정보를 가져와서 출력
        lblLatitude.text = String(format: ".4f", latestLocation.coordinate.latitude)
        lblLongitude.text = String(format: ".4f", latestLocation.coordinate.longitude)
        lblAltitude.text = String(format: ".4f", latestLocation.altitude)
        
        //첫번째 위치 정보를 저장
        if startLocation == nil {
            startLocation = latestLocation
        }
        
        //거리 계산
        let distanceBetween = latestLocation.distance(from: startLocation)
        lblDistance.text = String(format: "%.2f", distanceBetween)
    }
}

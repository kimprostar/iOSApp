import UIKit

class RootViewController: UITableViewController {

    //테이블에 출력할 데이터 배열
    var titles = Array<String>()
    var contents = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "iOS 실습 내용"
        
        titles.append("첫번째 SDK")
        contents.append("버튼 선택 시 배경 색 변경")
        
        titles.append("터치 이벤트")
        contents.append("이미지 터치, 흔들기, 회전 이벤트")
        
        titles.append("시계")
        contents.append("타이머와 레이블을 이용한 시계")
        
        titles.append("텍스트 필드 입력 버튼")
        contents.append("버튼을 누르면 텍스트 입력")

        titles.append("이미지 애니메이션")
        contents.append("이미지 확대/축소/회전")

        titles.append("스크롤 뷰")
        contents.append("스크롤 기능 이용 화면에 이미지 표시")

        titles.append("이미지 스와이프")
        contents.append("여러 이미지 옆으로 스와이프")
        
        titles.append("피커 뷰")
        contents.append("피커뷰를 이용하여 이미지 변경")
        
        titles.append("로그인 대화상자")
        contents.append("버튼을 이용해 로그인 대화상자 만들기")
        
        titles.append("화면 이동")
        contents.append("버튼을 이용해 화면 이동")
        
        titles.append("테이블 뷰")
        contents.append("셀에 이미지와 보조 텍스트 출력")
        
        titles.append("테이블 뷰 셀")
        contents.append("테이블 뷰 셀로 부터 상속받은 클래스와 연결")
        
        titles.append("사용자 정의 셀")
        contents.append("셀을 원하는 모양으로 만들어서 출력")
        
        titles.append("테이블 뷰 편집")
        contents.append("데이터를 삽입하고 삭제 그리고 이동")
        
        titles.append("그룹 별 분류")
        contents.append("한글 자음 별 분류 및 검색 과 인덱싱")
        
        titles.append("하위 데이터 출력")
        contents.append("테이블 뷰의 업데이트도 수행")
        
        titles.append("컬렉션 뷰 사용")
        contents.append("컬렉션 뷰의 출력 과 선택 이벤트")
        
        titles.append("Master Detail")
        contents.append("테이블뷰에 현재 시간 추가/삭제/상세보기")
        
        titles.append("소켓 프로그래밍")
        contents.append("TCP 소켓 프로그래밍")
        
        titles.append("동기적 다운로드")
        contents.append("텍스트와 이미지를 동기적으로 다운로드 받아서 출력")
        
    }

    //섹션의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 구분자를 생성
        let cellIdentifier = "cell"
        //테이블 뷰에서 재사용 가능한 셀을 받아옵니다.
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        //재사용 가능 셀이 없으면 생성
        //style을 subtitle로 설정하면 레이블 2개, 이미지 뷰 1개
        //엑세서리 뷰 1개 모두 사용 가능
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        //레이블에 텍스트를 출력
        cell!.textLabel!.text = titles[indexPath.row]
        cell!.detailTextLabel!.text = contents[indexPath.row]
        //엑세서리 모양을 설정
        cell!.accessoryType = .disclosureIndicator

        return cell!
    }
    

    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath.row == 0{
        let storyboard = UIStoryboard(name: "FirstSDK", bundle: nil)
        let firstSDKViewController = storyboard.instantiateViewController(withIdentifier: "sdk") as! FirstSDKViewController
            self.navigationController?.pushViewController(firstSDKViewController, animated: true)
        }else if indexPath.row == 1{
            let storyboard = UIStoryboard(name: "TouchEvent", bundle: nil)
            let tev = storyboard.instantiateViewController(withIdentifier: "tev") as! TouchEventViewController
            self.navigationController?.pushViewController(tev, animated: true)
        }else if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Clock", bundle: nil)
            let clv = storyboard.instantiateViewController(withIdentifier: "clv") as! ClockViewController
            self.navigationController?.pushViewController(clv, animated: true)
        }else if indexPath.row == 3{
            let storyboard = UIStoryboard(name: "Control", bundle: nil)
            let ctv = storyboard.instantiateViewController(withIdentifier: "ctv") as! ControlTestViewController
            self.navigationController?.pushViewController(ctv, animated: true)
        }else if indexPath.row == 4{
            let storyboard = UIStoryboard(name: "ImageAnimation", bundle: nil)
            let iav = storyboard.instantiateViewController(withIdentifier: "iav") as! ImageAnimationViewController
            self.navigationController?.pushViewController(iav, animated: true)
        }else if indexPath.row == 5{
            let storyboard = UIStoryboard(name: "ScrollTest", bundle: nil)
            let sctv = storyboard.instantiateViewController(withIdentifier: "sctv") as! ScrollTestViewController
            self.navigationController?.pushViewController(sctv, animated: true)
        }else if indexPath.row == 6{
            let storyboard = UIStoryboard(name: "ImageSwipe", bundle: nil)
            let imsv = storyboard.instantiateViewController(withIdentifier: "imsv") as! ImageSwipeViewController
            self.navigationController?.pushViewController(imsv, animated: true)
        }else if indexPath.row == 7{
            let storyboard = UIStoryboard(name: "PickerView", bundle: nil)
            let pv = storyboard.instantiateViewController(withIdentifier: "pv") as! PickerViewViewController
            self.navigationController?.pushViewController(pv, animated: true)
        }else if indexPath.row == 8{
            let storyboard = UIStoryboard(name: "UserNotification", bundle: nil)
            let unv = storyboard.instantiateViewController(withIdentifier: "unv") as! UserNotificationViewController
            self.navigationController?.pushViewController(unv, animated: true)
        }else if indexPath.row == 9{
            let storyboard = UIStoryboard(name: "Switch", bundle: nil)
            let svc = storyboard.instantiateViewController(withIdentifier: "sv") as! SwitchViewController
            self.navigationController?.pushViewController(svc, animated: true)
        }else if indexPath.row == 10{
            let storyboard = UIStoryboard(name: "BasicTable", bundle: nil)
            let btv = storyboard.instantiateViewController(withIdentifier: "btv") as! BasicTableViewController
            self.navigationController?.pushViewController(btv, animated: true)
        }else if indexPath.row == 11{
            let storyboard = UIStoryboard(name: "UserDefineCell", bundle: nil)
            let udcv = storyboard.instantiateViewController(withIdentifier: "udcv") as! UserDefineCellViewController
            self.navigationController?.pushViewController(udcv, animated: true)
        }else if indexPath.row == 12{
            let customCellViewController = self.storyboard?.instantiateViewController(withIdentifier: "CustomCellViewController") as! CustomCellViewController
            self.navigationController?.pushViewController(customCellViewController, animated: true)
        }else if indexPath.row == 13{
            let editTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditTableViewController") as! EditTableViewController
            self.navigationController?.pushViewController(editTableViewController, animated: true)
        }else if indexPath.row == 14{
            let classificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ClassificationViewController") as! ClassificationViewController
            self.navigationController?.pushViewController(classificationViewController, animated: true)
        }else if indexPath.row == 15{
            let attractionMainViewController = self.storyboard?.instantiateViewController(withIdentifier: "AttractionMainViewController") as! AttractionMainViewController
            self.navigationController?.pushViewController(attractionMainViewController, animated: true)
        }else if indexPath.row == 16{
            let carCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CarCollectionViewController") as! CarCollectionViewController
            self.navigationController?.pushViewController(carCollectionViewController, animated: true)
        }else if indexPath.row == 17{
            let storyboard = UIStoryboard(name: "MasterDetail", bundle: nil)
            let mvc = storyboard.instantiateViewController(withIdentifier: "mvc") as! MasterViewController
            self.navigationController?.pushViewController(mvc, animated: true)
        }else if indexPath.row == 18{
            let socketClientViewController = self.storyboard?.instantiateViewController(withIdentifier: "SocketClientViewController") as! SocketClientViewController
            self.navigationController?.pushViewController(socketClientViewController, animated: true)
        }else if indexPath.row == 19{
            let syncDownloadViewController = self.storyboard?.instantiateViewController(withIdentifier: "syncdownloadview") as! SyncDownloadViewController
            self.navigationController?.pushViewController(syncDownloadViewController, animated: true)
        }


    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}


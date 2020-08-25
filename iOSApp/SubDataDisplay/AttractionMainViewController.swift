
import UIKit

struct MainVO{
    var title : String!
    var imageName : String!
    var link : String!
}

class AttractionMainViewController: UITableViewController {

    //RefreshControl이 보여질 때 호출되는 메소드를 작성
    @objc func handleRequest(_ refreshControl : UIRefreshControl){
        //서버에서 데이터를 새로 가져오는 문장
        //서버에서 데이터를 매 번 가져오는 부분을 구현할 때는 서버의 데이터 생성을 잘 해야 합니다.
        var mainVO = MainVO()
        mainVO.title = "그랜드 캐년"
        mainVO.imageName = "grand_canyon.jpg"
        mainVO.link = "https://en.wikipedia.org/wiki/grand_canyon"
        
        //맨 앞에 데이터를 추가
        list.insert(mainVO, at: 0)
        //일정시간 대기 - 원래는 안함
        //네이버나 다음 같은 Open API의 데이터를 많이 가져올 때는
        //중간에 sleep을 넣기도 합니다.
        //네이버는 1초에 10개 이상 가져오면 429 에러
        sleep(5)
        refreshControl.endRefreshing()
        
        //테이블 뷰를 다시 출력
        //self.tableView.reloadData()
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        tableView.endUpdates()
    }
    
    //출력할 데이터 배열 생성
    var list = Array<MainVO>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //하나의 인스턴스 생성
        var mainVO = MainVO()
        mainVO.title = "버킹검 궁전"
        mainVO.imageName = "buckingham_palace.jpg"
        mainVO.link = "https://en.wikipedia.org/wiki/Buckingham_Palace"
        //배열에 추가
        list.append(mainVO)
        
        //두번째 인스턴스 추가
        mainVO = MainVO()
        mainVO.title = "에펠탑"
        mainVO.imageName = "eiffel_tower.jpg"
        mainVO.link = "https://en.wikipedia.org/wiki/Eiffel_Tower"
        //배열에 추가
        list.append(mainVO)
        
        //세번째 인스턴스 추가
        mainVO = MainVO()
        mainVO.title = "엠파이어 스테이트 빌딩"
        mainVO.imageName = "empire_state_building.jpg"
        mainVO.link = "https://en.wikipedia.org/wiki/Empire_State_Building"
        //배열에 추가
        list.append(mainVO)
        
        
        //상단에 RefreshControl을 배치
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(handleRequest(_:)), for: .valueChanged)
        //운영체제 별로 다르게 적용 -  10.0 이상과 아래 버전을 다르게 적용
        if #available(iOS 10.0, *){
            tableView.refreshControl = refreshControl
        }else{
            tableView.addSubview(refreshControl!)
        }
    }

    // MARK: - Table view data source

    //테이블 뷰 섹션의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //섹션 별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        //행 번호에 해당하는 데이터 찾아오기
        let mainVO = list[indexPath.row]
        
        //데이터 출력하기
        cell!.imageView!.image =
            UIImage(named:mainVO.imageName)
        cell!.textLabel!.text = mainVO.title

        
        return cell!
    }
    
    //셀을 누를 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //선택한 행에 해당하는 데이터를 가져오기
        let mainVO = list[indexPath.row]
        //하위 뷰 컨트롤러 객체 만들기
        let attractionSubViewController = self.storyboard?.instantiateViewController(withIdentifier: "AttractionSubViewController") as! AttractionSubViewController
        //데이터 넘겨주기
        attractionSubViewController.link = mainVO.link
        //화면 출력
        
        self.navigationController?.pushViewController(attractionSubViewController, animated: true)
        
        
    }
    
    var flag = false
    //새로운 셀이 보여질 때 호출되는 메소드
    //서버로부터 데이터를 받아서 사용할 때는 페이지 번호나 현재 데이터 개수와 전체 데이터 개수를 파악해서 2개의 데이터 개수가 같으면
    //아무일도 하지 않아야 합니다.
    override func tableView(_ tableView:UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath:IndexPath){
        
        //처음 보여질 때는 동작하지 않도록 하기 위해서 flag를 true 설정
        if flag == false && indexPath.row == list.count - 1{
            flag = true
        }
        else if flag == true && indexPath.row == list.count - 1{
            var mainVO = MainVO()
            mainVO.title = "윈저궁"
            mainVO.imageName = "windsor_castle.jpg"
            mainVO.link = "https://en.wikipedia.org/wiki/windsor_castle"
            list.append(mainVO)
            tableView.reloadData()
        }
    }
}

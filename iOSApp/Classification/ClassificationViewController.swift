import UIKit

class ClassificationViewController: UIViewController {
    //데이터를 저장할 변수
    @IBOutlet weak var tableView: UITableView!
    
    //검색 기능을 위한 인스턴스 생성
    let searchController = UISearchController(searchResultsController: nil)
    var filteredPlayers = [String]()
    
    //검색을 위한 메소드
    
    //검색란이 비어있는지 확인하는 메소드
    func searchBarIsEmpty() -> Bool{
        //??는 앞의 결과가 nil 이면 리턴되는 연산자 입니다.
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    //검색 란에 내용을 입력하면 호출되는 메소드
    func filterContentForSearchText(_ searchText:String, scope:String = "All"){
        //data 배열의 모든 데이터를 순차적으로 접근해서 소문자로 변경한 후 searchText이 존재하면 모아서 filteredPlayers에 대입
        filteredPlayers = data.filter({(player:String)-> Bool in return player.lowercased().contains(searchText.lowercased())})
        //데이터를 다시 출력
        tableView.reloadData()
        
        //최근의 언어들에는 배열에 3개의 메소드가 추가된 경우가 많습니다.
        
        //map 은 매개변수가 1개이고 리턴하는 함수를 대입해서
        //배열의 데이터를 변환해서 사용하고자 할 때 사용하는 함수
        
        //filter는 매개변수가 1개이고 Bool을 리턴하는 함수를 대입해서
        //배열에서 true를 리턴하는 데이터만 골라내는 함수
        
        //reduce는 매개변수가 2개이고 하나의 값을 리턴하는 함수를
        //대입해서 배열의 데이터를 가지고 연산을 해서
        //그 결과를 리턴하는 함수
        
        //map-reduce: 데                                             이터가 존재하는 곳에서 연산을 수행하고
        //그 결과를 합쳐서 최종 결과를 만들어내는 방식
        
        //엣지 컴퓨팅: 데이터 발생지에서 무엇이가를 하자
    }
    
    //검색 입력 란의 상태를 리턴하는 메소드
    func isFiltering() -> Bool{
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    var data:Array<String> = [] //기본 데이터를 저장할 문자열 배열
    //각 자음별 데이터를 소유할 변수
    var sectionData:Array<Dictionary<String, Any>> = []
    //인덱스를 저장할 배열
    var indexes:Array<String> = []
    
    func substract(data:String)->String{
        var result = data.compare("나")
        if result == ComparisonResult.orderedAscending{
            return "ㄱ"
        }
        result = data.compare("다")
        if result == ComparisonResult.orderedAscending{
            return "ㄴ"
        }
        result = data.compare("라")
        if result == ComparisonResult.orderedAscending{
            return "ㄷ"
        }
        result = data.compare("마")
        if result == ComparisonResult.orderedAscending{
            return "ㄹ"
        }
        result = data.compare("바")
        if result == ComparisonResult.orderedAscending{
            return "ㅁ"
        }
        result = data.compare("사")
        if result == ComparisonResult.orderedAscending{
            return "ㅂ"
        }
        result = data.compare("아")
        if result == ComparisonResult.orderedAscending{
            return "ㅅ"
        }
        result = data.compare("자")
        if result == ComparisonResult.orderedAscending{
            return "ㅇ"
        }
        result = data.compare("차")
        if result == ComparisonResult.orderedAscending{
            return "ㅈ"
        }
        result = data.compare("카")
        if result == ComparisonResult.orderedAscending{
            return "ㅊ"
        }
        result = data.compare("타")
        if result == ComparisonResult.orderedAscending{
            return "ㅋ"
        }
        result = data.compare("파")
        if result == ComparisonResult.orderedAscending{
            return "ㅌ"
        }
        result = data.compare("하")
        if result == ComparisonResult.orderedAscending{
            return "ㅍ"
        }
        return "ㅎ"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //업데이트 되었을 때 적용할 뷰 컨트롤러 설정
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "검색할 이름을 입력하세요"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        //기본 데이터 생성
        data = ["김좌진", "홍범도", "이청천", "안중근", "유관순","남자현","이봉창", "안창호", "이준",
        "윤동주", "이상재", "한용운", "김구", "박열", "이범석", "신채호", "이동휘", "지청천", "김마리아", "이시영"]
        
        //인덱스 생성
        indexes = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        
        //2차원 배열을 생성 - 임시로 데이터를 저장할 배열
        var temp : [[String]] = Array(repeating: Array(), count: 14)
        
        //분류 작업
        var i=0
        //인덱스를 순회하면서
        while i < indexes.count{
            let firstName = indexes[i]
            //데이터를 순회
            var j = 0
            while j < data.count{
                let str = data[j]
                if firstName == substract(data: str){
                    temp[i].append(str)
                }
                j = j + 1
            }
            i = i + 1
        }
        
        //분류된 배열들을 정렬
        i = 0
        //이차원 배열을 순회하면서
        while i < temp.count{
            //각 배열의 데이터의 개수가 2보다 크거나 같으면
            if temp[i].count >= 2{
                //배열의 데이터를 정렬
                temp[i].sort()
            }
            i = i + 1
        }
        
        //각각의 배열을 인덱스와 묶어서 Dictionary를 만들고 이 디셔너리를 분류 배열에 저장
        i = 0
        //임시로 분류한 이차원 배열을 순회하면서
        while i < indexes.count{
            //배열에 데이터가 존재하는 경우에만
            if temp[i].count > 0{
                //배열의 데이터와 인덱스에 저장된 한글 자음을
                //디셔너리로 만들고 배열에 저장
                var dic : Dictionary<String, Any> = [:]
                dic["section_name"] = indexes[i]
                dic["data"] = temp[i]
                //데이터 배열에 dic를 추가
                sectionData.append(dic)
            }
            
            i = i + 1
        }
    }
}


//검색결과 업데이트를 위한 메소드 구현을 위한 extension
extension ClassificationViewController : UISearchResultsUpdating{
    //업데이트를 하고자 하는 메소드를 호출해야 하는 메소드
    func updateSearchResults(for searchController: UISearchController) {
        //업데이트는 이 메소드의 결과로 수행
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


//테이블 뷰 출력을 위한 extension
extension ClassificationViewController : UITableViewDelegate, UITableViewDataSource{
    //섹션의 개수를 설정하는 메소드 - 선택적 구현
    func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering(){
            return 1
        }
        return sectionData.count
    }
    
    //행의 개수를 설정하는 메소드 - 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredPlayers.count
        }
        
        //섹션 번호에 해당하는 데이터를 찾기
        let dic = sectionData[section]
        //배열 데이터 찾아오기
        //iOS에서 swift 자료형으로 바로 변환이 안되는 경우가 있음
        //Objective-C의 자료형으로 변환한 후 다시 변환
        //Objective-C의 자료형은 swift 자료형 앞에 NS를 추가
        let ar = (dic["data"] as! NSArray) as Array
        
        //데이터 개수 리턴
        return ar.count
    }
        
    
    //셀의 모양을 설정하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifer)
        }
        
        if isFiltering(){
            cell!.textLabel!.text = (filteredPlayers[indexPath.row])
            return cell!
        }
        
        //섹션 번호를 디셔너리를 찾고 디셔너리 안의 배열에서
        //행 번호를 이용해서 출력할 데이터를 찾아와야 합니다.
        let dic = sectionData[indexPath.section]
        let ar = (dic["data"] as! NSArray) as Array
        let name = ar[indexPath.row] as! String
        //셀에 출력
        cell!.textLabel!.text = name
        
        return cell!
    }
    
    //섹션의 문자열을 설정하는 메소드
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int) -> String?{
        if isFiltering(){
            return "검색 결과"
        }
        
        let dic = sectionData[section]
        
        return (dic["section_name"] as! String)
    }
    
    //테이블 뷰에 인덱스를 만들어주는 메소드
    func sectionIndexTitles(for tableView:UITableView) -> [String]?{
        return indexes
    }
    
    //인덱스를 클릭하면 호출되는 메소드
    //정수를 리턴하면 테이블 뷰는 그 정수 번째에 해당하는 섹션을 화면에 출력
    func tableView(_ tableView:UITableView, sectionForSelectionIndexTitle title:String, at index:Int) -> Int{
        //title은 인덱스에서 누른 문자
        //index는 누른 문자의 인덱스
        //리턴하는 값은 테이블 뷰에서 출력할 섹션의 인덱스
        
        //누른 문자와 일치하는 인덱스 배열의 문자를 찾아서 그 위치를 리턴
        for i in 0..<sectionData.count{
            let dic = sectionData[i]
            let sectionName = dic["section_name"] as! String
            if sectionName == title{
                return i
            }
        }
        //일치하는 데이터가 없으면 -1 (0을 리턴하기도 합니다.)
        return -1
    }
    
    
    
    
}

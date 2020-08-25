import UIKit

class EditTableViewController: UITableViewController {
    var apple = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "테이블 뷰 편집"
        
        apple.append("iPod")
        apple.append("MacBook Pro")
        apple.append("iPhone")
        apple.append("iPad")
        
        //add 아이콘을 이용하고 누르면 self에 있는 insertItem이라는
        //메소드를 호출하는 바 버튼 아이템 생성
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertItem(_:)))
        
        /*
         //글자를 설정하는 바 버튼 아이템
        let addButton = UIBarButtonItem(title: "삽입", style: .done, target: self, action: #selector(insertItem(_:)))
         */
        
        //오른쪽에 바 버튼 아이템 배치
        self.navigationItem.rightBarButtonItems = [editButtonItem, addButton]

    }

//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apple.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        //apple의 데이터 출력
        cell!.textLabel!.text = apple[indexPath.row]

        return cell!
    }
    
    //edit 버튼을 누르면 보여지는 아이콘의 모양을 설정
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    //실제 삭제 버튼을 눌렀을 때 호출되는 메소드
    override func tableView(_ tableView:UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath){
        //실제 데이터를 삭제하고 삭제한 후 의 행동을 설정
        self.apple.remove(at: indexPath.row)
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section:0)], with: .bottom)
        self.tableView.endUpdates()
    }
    
    
    //셀의 이동을 할 수 있도록 들여쓰기를 해주는 메소드
    override func tableView(_ tableView:UITableView, shouldIndentWhileEditingRowAt indexPath:IndexPath)->Bool{
        return false
    }
    
    //셀의 이동이 끝났을 때 호출되는 메소드
    override func tableView(_ tableView:UITableView, moveRowAt sourceIndexPath:IndexPath,
        to destinationIndexPath:IndexPath){
        //처음 잡은 자리의 데이터를 다른 곳으로 복사
        let moveObj = self.apple[sourceIndexPath.row]
        //배열에서 처음 잡은 자리의 데이터를 삭제
        self.apple.remove(at: sourceIndexPath.row)
        //배열에 놓은 자리에 추가
        self.apple.insert(moveObj, at: destinationIndexPath.row                               )
    }

    //네비게이션 바의 바 버튼 아이템을 클릭했을 때 호출될 메소드
    @objc func insertItem(_ sender:UIBarButtonItem){
        //한 줄 입력을 위한 대화상자를 생성
        let alert = UIAlertController(title: "아이템 등록", message: "등록할 아이템을 입력하세요", preferredStyle: .alert)
        //한 줄 입력을 위한 텍스트 필드를 추가
        alert.addTextField(configurationHandler: {(tf) -> Void in
            tf.placeholder = "등록할 아이템 이름을 입력하세요!!!"
        })
        //버튼을 생성
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {(_) -> Void in
            //텍스트 필드에 입력한 내용을 가져오기
            let item = alert.textFields?[0].text
            //데이터에 추가
            //핸들러(클로저)안에서 클래스에 만든 인스턴스 변수 호출할 때
            //반드시 self를 붙여야 합니다.
            
            //self.apple.append(item!) //가장 나중에 추가
            //다음 페이지의 데이터를 가져올 때는 나중에 추가
            
            self.apple.insert(item!, at: 0) //앞에 추가
            //새로운 데이터를 가져오는 업데이트를 할 때는 앞에 추가
            
            //테이블 뷰 재출력
            //self.tableView.reloadData()
            
            //테이블 뷰 애니메이션 추가
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            //append로 추가한 경우
            /*
            self.tableView.insertRows(at: [IndexPath(row: self.apple.count - 1, section: 0)], with: .right)
             */
            
            self.tableView.endUpdates()
        }))
        //화면 출력
        present(alert, animated: true)
    }

}

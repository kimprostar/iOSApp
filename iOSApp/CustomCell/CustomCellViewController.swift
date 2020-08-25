
import UIKit

class CustomCellViewController: UITableViewController {
    
    var appDelegate : AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "사용자 정의 셀"
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        
        return appDelegate!.images1.count
    }

    //셀을 생성해주는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //셀을 수정한 적이 없으면 아무 이름이나 상관없고
        //셀을 수정했을면 셀의 Identifier를 설정해야 합니다.
        //이 부분을 틀리면 Identifier 예외가 발생
        //인터페이스 빌더에서 셀을 선택하고 ID를 설정하던가 이 코드를 수정
        let cellIdentifier = "MyCustomCell"
        
        //자신의 셀 클래스로 형 변환
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MyCustomCell
        
        //데이터 출력
        cell?.imgView.image = UIImage(named: appDelegate!.images1[indexPath.row])
        

        return cell!
    }
    
    //셀의 높이를 설정하는 메소드
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

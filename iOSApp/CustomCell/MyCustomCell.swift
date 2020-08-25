import UIKit

class MyCustomCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func imageSwitch(_ sender: Any) {
        //선택된 행 번호를 찾아오기
        //사용자 정의 셀에 이벤트 핸들링을 위한 뷰가 포함되면 이 코드를 많이 사용
        let tableView = self.superview! as! UITableView
        let indexPath = tableView.indexPath(for: self)
        
        //스위치의 상태값 가져오기
        let imageSwitch = sender as! UISwitch
        
        //공유 데이터를 사용하기 위한 참조 변수 만들기
        let delegate = UIApplication.shared.delegate as! AppDelegate
        //스위치의 상태에 따라 이미지를 다르게 적용
        if imageSwitch.isOn == true{
            imgView.image = UIImage(named:delegate.images1[indexPath!.row])
        }else{
            imgView.image = UIImage(named:delegate.images2[indexPath!.row])
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

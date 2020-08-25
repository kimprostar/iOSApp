import UIKit

class CarCollectionViewController: UIViewController {
    //컬렉션 뷰에 출력할 이미지 파일 이름을 저장할 배열
    var images = Array<String>()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "컬렉션 뷰"
        //car00.jpg ~ car24.jpg 를 배열에 추가
        for i in 0...24{
            let imgName = String(format: "car%02i.jpg", i)
            images.append(imgName)
        }
    }

}

//CollectionView 출력을 위한 extension
extension CarCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    //셀의 개수를 설정하는 메소드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //셀을 만들어주는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //셀을 생성
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCell", for: indexPath) as! CollectionViewCustomCell
        //출력
        cell.imgView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    //셀의 크기를 설정하는 메소드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    
    //마진 간격을 설정하는 메소드
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, minimumLineSpacingForSectionAt section:Int) -> CGFloat{
        return 1
    }
    
    //패딩 간격을 설정하는 메소드
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat{
        return 1
    }
    
    //셀을 선택하고 난 후 호출되는 메소드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //선택했을 때 수행할 내용
        //셀의 선색과 두께 변경
        //선 색이나 두께는 layer를 이용해서 설정
        let cell = collectionView.cellForItem(at: indexPath)
        //선색상 설정
        cell!.layer.borderColor = UIColor.blue.cgColor
        cell!.layer.borderWidth = 5.0
    }
}

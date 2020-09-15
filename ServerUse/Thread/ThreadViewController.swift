import UIKit

class ThreadViewController: UIViewController {

    //화면에 출력할 이미지 뷰 와 레이블
    var imageView : UIImageView!
    var imageName : UILabel!
    
    //url에서 데이터를 다운로드 받아서 Image로 변환한 후
    //ImageView 에 출력하는 스레드
    class ImageDownloader : Thread{
        var imageView : UIImageView!
        var url:URL!
        
        override func main(){
            let queue = OperationQueue()
            //클러저 안에서 외부 클래스의 인스턴스 변수를 사용할 때는
            //self.을 붙여 주어야 합니다.
            queue.addOperation{
                let imageData = try! Data(contentsOf: self.url)
                let image = UIImage(data: imageData)
                OperationQueue.main.addOperation{
                    self.imageView.image = image
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imageView 배치
        let frame = UIScreen.main.bounds
        imageView = UIImageView(frame:CGRect(x:0, y:0, width:300, height: 300))
        imageView.center = CGPoint(x:frame.width/2, y:frame.height/2)
        self.view.addSubview(imageView)
        
        //스레드를 생성하고 시작
        let downloader = ImageDownloader()
        downloader.imageView = imageView
        downloader.url = URL(string:"http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG")
        
        downloader.start() //스레드 시작
        
        //label 배치
        imageName = UILabel(frame: CGRect(x:0, y:0, width:300, height: 50))
        imageName.center = CGPoint(x:imageView.center.x, y:imageView.center.y + 200)
        imageName.textAlignment = .center
        imageName.text = "수지"
        self.view.addSubview(imageName)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

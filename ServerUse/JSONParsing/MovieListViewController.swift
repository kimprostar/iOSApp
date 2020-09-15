
import UIKit

class MovieListViewController: UITableViewController {

    //테이블 뷰에 출력할 데이터 배열
    var movieList = Array<Movie>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "영화목록"
        //동기적으로 데이터를 다운로드 받기
        let url = URL(string:"http://cyberadam.cafe24.com/movie/list")
        let data = try! Data(contentsOf:url!)
        //NSLog("\(data)")
        
        //다운로드 받은 데이터를 JSON 파싱
        let result = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        //객체 안의 list 라는 이름의 배열 가져오기
        let list = result["list"] as! NSArray
        
        //배열 순회
        for index in 0...(list.count-1){
            //배열 안의 객체 가져오기
            let item = list[index] as! NSDictionary
            //각 요소를 꺼내서 Movie 에 저장
            let movieid = (item["movieid"] as! NSNumber).intValue
            let title = item["title"] as! String
            let genre = item["genre"] as! String
            let rating = (item["rating"] as! NSNumber).doubleValue
            let link = item["link"] as! String
            let thumbnail = item["thumbnail"] as! String
            //NSLog(thumbnail)
            
            let movie:Movie = Movie(movieId: movieid, title: title, genre: genre, rating: rating, link: link, thumbnail: thumbnail)
            //NSLog(movie.thumbnail)
            
            movieList.append(movie)
            
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //직접 작성한 MovieCell 생성
        let cellIdentifier = "MovieCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MovieCell
       //행 번호에 해당하는 데이터 찾기
        let movie = movieList[indexPath.row]
        
        //데이터를 출력
        cell.lblTitle.text = movie.title
        cell.lblGenre.text = movie.genre
        cell.lblRating.text = "\(movie.rating!)"
        //이미지를 다운로드 받아서 출력
        let imageURL = URL(string: "http://cyberadam.cafe24.com/movieimage/\(movie.thumbnail!)")
        NSLog(imageURL!.description)
        let imageData = try! Data(contentsOf:imageURL!)
        let image = UIImage(data: imageData)
        cell.imgThumbnail.image = image

        return cell
    }
    
    //셀의 높이를 설정하는 메소드
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

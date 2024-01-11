import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //초기 화면에서 url로 이미지 불러오기
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg")
        imageView.load(url: url!)
    }
    
    //버튼 누를 시 화면 전환
    @IBAction func tappedListButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ListViewController") as? ListViewController else { return }
        
        self.present(nextVC, animated: true)
    }
    
    @IBAction func tappedCompleteButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
        
        self.present(nextVC, animated: true)
    }
    


}

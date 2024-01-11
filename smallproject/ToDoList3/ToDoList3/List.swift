import Foundation
import UIKit

//list 구조
struct List {
    var title : String
    var date : String
    var complete : Bool
}

//테이블에서 보여지는 cell
class ListCell : UITableViewCell {
    @IBOutlet weak var todoDate : UILabel!
    @IBOutlet weak var todotitle : UILabel!
    @IBOutlet weak var todoComplete: UISegmentedControl!
    
    var list: List?
    
    @IBAction func segmentChanged(_ sender: Any) {
        guard let list else { return }
        if todoComplete.selectedSegmentIndex == 0 {
            todotitle?.text = nil
            todotitle?.attributedText = list.title.strikeThrough()
        } else {
            todotitle?.attributedText = nil
            todotitle?.text = list.title
        }
    }
    
    func setTask(_ _list: List) {
        list = _list
        guard let list else { return }
        if list.complete {
            todotitle?.text = nil
            todotitle?.attributedText = list.title.strikeThrough()
        } else {
            todotitle?.attributedText = nil
            todotitle?.text = list.title
        }
        if list.complete {
            todoComplete.selectedSegmentIndex = 0
        } else {
            todoComplete.selectedSegmentIndex = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

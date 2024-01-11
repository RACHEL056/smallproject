import Foundation
import UIKit

//테이블의 셀 형태 지정
class ListCell : UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var completeSeg : UISegmentedControl!
    
    var list : Todo?
    
    @IBAction func segmentChanged(_ sender: Any) {
        guard let list else { return }
        if completeSeg.selectedSegmentIndex == 0 {
            titleLabel?.text = nil
            titleLabel?.attributedText = list.title.strikeThrough()
        } else {
            titleLabel?.attributedText = nil
            titleLabel?.text = list.title
        }
    }
    func setTask(_ _list: Todo) {
        list = _list
        guard let list else { return }
        if list.complete {
            titleLabel?.text = nil
            titleLabel?.attributedText = list.title.strikeThrough()
        } else {
            titleLabel?.attributedText = nil
            titleLabel?.text = list.title
        }
        if list.complete {
            completeSeg.selectedSegmentIndex = 0
        } else {
            completeSeg.selectedSegmentIndex = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

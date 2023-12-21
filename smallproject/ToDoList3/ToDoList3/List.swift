import Foundation
import UIKit

//list 구조
struct List {
    var title : String
    var date : String
}

//테이블에서 보여지는 cell
class ListCell : UITableViewCell {
    @IBOutlet weak var todoDate : UILabel!
    @IBOutlet weak var todotitle : UILabel!
    
}

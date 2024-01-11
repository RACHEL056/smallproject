import Foundation
import UIKit

class CompleteViewController: UITableViewController {
    
    
    var completeList = datas.filter { $0.complete == true }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return completeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteCell", for: indexPath)
        
        let thiscell = completeList[indexPath.row]
        let title = thiscell.title
        let date = thiscell.date
        
        cell.textLabel?.text = "[\(title)]\(date) - 완료 "
        return cell
    }
}

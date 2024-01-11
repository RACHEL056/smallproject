
import UIKit

var datas : [List] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //alert로 할 일 추가하기
    @IBAction func addalertButton(_ sender: Any) {
        let title = "오늘의 할 일\n\n"
        let message = "추가할 task를 입력하세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "할 일"
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: -70, y: 10, width: 270, height: 100)
        alert.view.addSubview(datePicker)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        //추가 후 데이터 리스트에 저장
        let add = UIAlertAction(title: "추가", style: .default) { [self]
            (_) in
            let newtask = alert.textFields?[0]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            datas.append(List(title: newtask!.text ?? "",date: dateString, complete: false))
            self.tableView.reloadData()
            }
        
        alert.addAction(cancel)
        alert.addAction(add)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //테이블 만들기
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    //리스트 행 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    //리스트 행에 따라 셀 제공
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
        
        let thiscell = datas[indexPath.row]
       cell.todoDate.text = thiscell.date
       cell.setTask(datas[indexPath.row])
       
        return cell
    }
    
    //행을 삭제할 때
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            datas.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

//취소선 긋는 확장자
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}


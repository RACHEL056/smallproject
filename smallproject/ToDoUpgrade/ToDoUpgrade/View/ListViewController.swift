import Foundation
import UIKit

let defaults = UserDefaults.standard
var datas: [Todo] {
    get {
        if let savedData = defaults.data(forKey: "todos"),
           let decodedData = try? JSONDecoder().decode([Todo].self, from: savedData) {
            return decodedData
        }
        return []
    }
    set {
        if let encodedData = try? JSONEncoder().encode(newValue) {
            defaults.set(encodedData, forKey: "todos")
        }
    }
}

//seg를 바꾸었을때 userdefault에서 값 변경하는 것 필요
class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let sections = ["work", "life"]
    let pickerView: UIPickerView = UIPickerView()
    var focusedRow: Int = 0
    var selectedRow: Int = 0
    
    //추가하기 버튼으로 할 일 목록 추가
    @IBAction func adddataalertButton(_ sender: Any) {
        let title = "오늘의 할 일\n\n\n\n"
        let message = "추가할 task를 입력하세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "할 일"
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: -70, y: 10, width: 270, height: 100)
        alert.view.addSubview(datePicker)
        
        pickerView.frame = CGRect(x: 0, y: 50, width: 270, height: 120)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        alert.view.addSubview(pickerView)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.pickerView.selectRow(self.selectedRow, inComponent: 0, animated: true)
        }
        //추가 후 데이터 리스트에 저장
        let add = UIAlertAction(title: "추가", style: .default) { [self]
            (_) in
            let newtask = alert.textFields?[0]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            self.selectedRow = self.focusedRow
            
            let newTodo = Todo(title: newtask!.text ?? "", date: dateString, section: sections[selectedRow], complete: false)
            datas.append(newTodo)
            self.tableView.reloadData()
        }
        
        alert.addAction(cancel)
        alert.addAction(add)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 테이블뷰에 헤더와 푸터 등록
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "footer")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 해당 섹션에 속하는 데이터만을 세어 반환
        let sectionData = datas.filter { $0.section == sections[section] }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
        
        // 해당 섹션에 속하는 데이터만을 가져오기
        let sectionData = datas.filter { $0.section == sections[indexPath.section] }
        
        // 데이터를 표시
        let thiscell = sectionData[indexPath.row]
        cell.dateLabel.text = thiscell.date
        cell.setTask(thiscell)
        
        return cell
    }
    
    //섹션 헤더에 sections 이름 할당
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")!
        headerView.textLabel?.text = sections[section]
        return headerView
    }
    
    //삭제 시
    //행을 삭제할 때
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            _ = datas.remove(at: indexPath.row)
            
            //datas에서 해당되는 내용 삭제 후 다시 encode 저장함
            updateUserDefaults()
            
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
            tableView.reloadData()
        }
    }
    
    
    func updateUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(datas) {
            defaults.set(encodedData, forKey: "todos")
        }
    }
}

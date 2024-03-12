//
//  ViewController.swift
//  SearchableTableview
//
//  Created by dreaMTank on 2024/03/07.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    @IBOutlet var table:UITableView!
    @IBOutlet var field: UITextField!
    
    var data = [String]()
    var filteredData = [String]()
    var filtered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            filterText(text + string)
        }
        
        return true
    }
    
    func filterText(_ query: String) {
        
        filteredData.removeAll()
        for string in data {
            if string.starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        
        table.reloadData()
        
        filtered = true
        
    }
    
    private func setupData() {
        data.append("つきにすっぽん")
        data.append("トカゲのしっぽ")
        data.append("ドブに捨てる")
        data.append("ラフな感じ")
        data.append("お楽しみにしてください")
        data.append("お誘いさせてください")
        data.append("時間を割いていただき")
        data.append("時間を空けていただき")
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        else {
            cell.textLabel?.text = data[indexPath.row]
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}


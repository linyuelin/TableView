//
//  ViewController.swift
//  CustomCells
//
//  Created by dreaMTank on 2024/03/07.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(FieldTableViewCell.nib(), forCellReuseIdentifier: FieldTableViewCell.identifier)
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > 5 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            
            customCell.configure(with: "Custom Cell", imageName: "gear")
            return customCell
        }
        
        
        if indexPath.row > 3 {
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.identifier, for: indexPath) as! FieldTableViewCell
            
            return fieldCell
        }
        
        
       
        
       let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "仮想通貨"
        
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector( didChangeSwitch), for: .valueChanged)
        mySwitch.isOn = true
        // UISwitchをセルのアクセサリービューとして設定
        cell.accessoryView = mySwitch
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("オープン")
        }
        else {
            print("クローズ")
        }
    }

}


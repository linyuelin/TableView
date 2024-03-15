//
//  ViewController.swift
//  ButtonInCell
//
//  Created by dreaMTank on 2024/03/13.
//

import UIKit



class ViewController: UIViewController  , UITableViewDataSource{
    


    @IBOutlet var table: UITableView!
    
    let data = ["ズレ","ギャップ" ,"財務的な健全性" ,"ぬけ漏れ" ,"工数" ,"そけつごう","プロキシーパターン"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
}


extension ViewController: MyTableViewCellDelegate {
    func didTapButton(with title: String) {
        print("\(title)")
    }
}

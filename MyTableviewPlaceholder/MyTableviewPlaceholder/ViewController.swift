//
//  ViewController.swift
//  MyTableviewPlaceholder
//
//  Created by dreaMTank on 2024/03/12.
//

import UIKit
import HGPlaceholders

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    private let tableView = TableView()
    
    var data = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.backgroundColor = .link
        tableView.showLoadingPlaceholder()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 , execute: {
            
            self.tableView.showErrorPlaceholder()
           
        })
    }
        
//        if data.isEmpty {
//            tableView.isHidden = true
//            let imageView = UIImageView(frame: .zero)
//        }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}


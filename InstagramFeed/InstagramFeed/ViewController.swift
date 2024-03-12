//
//  ViewController.swift
//  InstagramFeed
//
//  Created by dreaMTank on 2024/03/12.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    var models = [InstagramPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(InstagramPost(numberOfLikes: 200, username: "zuck", userImageName: "head", postImageName: "post_1"))
        
        models.append(InstagramPost(numberOfLikes: 200, username: "john", userImageName: "head", postImageName: "post_2"))
        
        models.append(InstagramPost(numberOfLikes: 200, username: "jenny", userImageName: "head", postImageName: "post_3"))
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 + 140 + view.frame.size.width
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

struct InstagramPost {
    let numberOfLikes: Int
    let username: String
    let userImageName: String
    let postImageName: String
}


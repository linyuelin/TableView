//
//  ViewController.swift
//  Mytableviewcontroller
//
//  Created by dreaMTank on 2024/03/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButtonOne(){
        
       let vc = MyTableViewController()
        vc.models = [
         
        ]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func didTapButtonTwo(){
       let vc =  MyTableViewController()
        vc.models = [
            ("first" , {
                print("ファスト")
            }),
            ("second" , {
                print("セカンド")
            }),
            ("thrid" , {
                print("スリード")
            })
        ]
        
        navigationController?.pushViewController(vc, animated: true)
    }

}


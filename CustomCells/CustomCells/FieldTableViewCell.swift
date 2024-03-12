//
//  FieldTableViewCell.swift
//  CustomCells
//
//  Created by dreaMTank on 2024/03/07.
//

import UIKit

class FieldTableViewCell: UITableViewCell , UITextFieldDelegate {
    
    static let identifier = "FieldTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldTableViewCell", bundle: nil)
    }
    
    @IBOutlet var field: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        field.placeholder = "タップしてみて"
        field.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("\(textField.text ?? "")")
        return true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}

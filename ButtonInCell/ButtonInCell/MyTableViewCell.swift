//
//  MyTableViewCell.swift
//  ButtonInCell
//
//  Created by dreaMTank on 2024/03/13.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}


class MyTableViewCell: UITableViewCell {

    static let identifier =  "MyTableViewCell"
    
    weak var delegate: MyTableViewCellDelegate?
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    private var title: String = ""
    
    @IBAction func didTapButton() {
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String ) {
        self.title = title
        button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.link, for: .normal)
    }

    
    
}

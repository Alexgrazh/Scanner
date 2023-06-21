//
//  AddtoSiriTableViewCell.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class AddtoSiriTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with data : AddSiriModal){
        titleLabel.text = data.title
    }
    
}

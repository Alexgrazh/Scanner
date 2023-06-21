//
//  StartAppTableViewCell.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class StartAppTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageСhoice: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageСhoice.isHidden = true
    }
    
    func configure(with data : StartAppWithModal){
        titleLabel.text = data.title
    }
}

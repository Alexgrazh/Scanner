//
//  AppearanceTableViewCell.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class AppearanceTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with data : AppearanceModel){
        titleLabel.text = data.title
    }

}

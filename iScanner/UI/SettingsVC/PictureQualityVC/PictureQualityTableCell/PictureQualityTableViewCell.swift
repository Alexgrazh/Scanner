//
//  PictureQualityTableViewCell.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class PictureQualityTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with data : PictureQualityModal){
        titleLabel.text = data.title
        SubtitleLabel.text = data.subTitle
    }
    
}

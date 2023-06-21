//
//  SettingsTableViewCell.swift
//  iScanner
//
//  Created by Alex Grazhdan on 12.05.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

  
    @IBOutlet weak var textLabeeCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func prepareForReuse(){
        super.prepareForReuse()
        textLabeeCell.text = nil
    }
    
    func configure(with: SettingsModal){
        textLabeeCell.text = with.textName
    }
}

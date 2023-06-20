//
//  SearchViewXib.swift
//  iScanner
//
//  Created by Alex Grazhdan on 13.05.2023.
//

import UIKit

class SearchViewXib: UIView {

    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override  func awakeFromNib() {
        super .awakeFromNib()
        searchBar.frame = CGRect(x: 0, y: 0, width: 361, height: 50)
        searchBar.layer.borderWidth = 2
        searchBar.layer.borderColor = UIColor.white.cgColor
    }
}

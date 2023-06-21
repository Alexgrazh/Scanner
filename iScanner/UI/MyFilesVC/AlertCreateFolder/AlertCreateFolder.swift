//
//  AlertCreateFolder.swift
//  iScanner
//
//  Created by Alex Grazhdan on 03.05.2023.
//

import UIKit

protocol AlertCreateFolderDelegate {
    func cancelBtnTapped()
    func createBtnTapped()
}

class AlertCreateFolder: UIView {

    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet var imageCreateFolder : UIImageView!
    @IBOutlet var titleAlertFolder : UILabel!
    @IBOutlet var textFildAlert : UITextField!
    @IBOutlet var canselButton: UIButton!
    @IBOutlet var  createButton : UIButton!
    
   public var delegate: AlertCreateFolderDelegate?
    
    override  func awakeFromNib() {
        super .awakeFromNib()
        viewBg.layer.cornerRadius = 15
        textFildAlert.placeholder = "Enter Name"

    }
  

    func setAlert( cancelBtn: String, createBtn: String) {
        canselButton.setTitle("Cancel", for: .normal)
        createButton.setTitle("Create", for: .normal)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        delegate?.cancelBtnTapped()
    }
    
    
    @IBAction func createBtnPressad(_ sender: Any) {
        delegate?.createBtnTapped()
    }
    
}

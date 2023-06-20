//
//  MainNavigation.swift
//  iScanner
//
//  Created by Alex Grazhdan on 20.06.2023.
//

import UIKit

protocol MainNavigationDelegate: AnyObject {
    func accountButtonPressed()
    func editButtonPressed()
}

class MainNavigation : UIView {
    
    
    var accountButtonAction: (() -> Void)?
    var editeButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    public func setupViews(){
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
     
    }
    
    private func loadViewFromXib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MainNavigation", bundle: bundle)
        
        return nib.instantiate(withOwner: self).first! as! UIView
    }
    
    

    @IBAction func accountAction(_ sender: Any) {
        print("pfmdfslkfjlsjfl[w[pew[ww")
       accountButtonAction?()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
       editeButtonAction?()
    }
    
}

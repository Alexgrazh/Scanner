//
//  CustomNavigation.swift
//  iScanner
//
//  Created by Alex Grazhdan on 20.06.2023.
//

import UIKit

protocol CustomeNavigationDelegate: AnyObject {
    func leftbuttonPressed()
}

class CustomNavigation: UIView {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var closeButtonAction: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func setupViews(){
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        
        bgView.layer.cornerRadius = 15
        bgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func loadViewFromXib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavigation", bundle: bundle)
        
        return nib.instantiate(withOwner: self).first! as! UIView
    }
    
    
    
    @IBAction func pressedButton(_ sender: Any) {
        print("lksadslkjfkls")
        closeButtonAction?()
    }
    
}

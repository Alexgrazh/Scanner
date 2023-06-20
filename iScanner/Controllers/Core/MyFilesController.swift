//
//  ViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 25.04.2023.
//

import UIKit


class MyFilesController: UIViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewMenu: UIView!
    
    @IBOutlet weak var singUpView: UIView!
    
    @IBOutlet weak var ViewNoDocuments: UIView!
    
    var isTapBatton = false
    
    
    private lazy  var alertView : AlertCreateFolder = {
        let alertView : AlertCreateFolder = AlertCreateFolder.loadFromNib()
        alertView.delegate = self
        
        return alertView
    }()
    
    
    private var visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect:blurEffect )
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var settingsView:SettingsView = {
        let settingsView : SettingsView = SettingsView.loadFromNib()
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        return settingsView
    }()
    
    
//    private var searchViewXib :SearchViewXib = {
//        let searchViewXib : SearchViewXib = SearchViewXib.loadFromNib()
//        searchViewXib.translatesAutoresizingMaskIntoConstraints = false
//        return searchViewXib
//    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scanner"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
//        configureNavigationItem()
        
        configureViewMenu()
        
        setupVisualEffectView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.title = "My Files"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @IBAction func accountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let vc = storyboard.instantiateViewController(withIdentifier: "settingsVc") as! SettingsViewController
       
              vc.title = "Settings"
              navigationController?.pushViewController(vc, animated: true)
              tabBarController?.tabBar.isHidden = true
    }
    
    private func configureViewMenu(){
        viewMenu.layer.cornerRadius = 15
        viewMenu.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        settingsView.layer.cornerRadius = 15
        settingsView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        singUpView.layer.cornerRadius = 10
    }
    
    
    //MARK: - Create Folder Button
    
    private func setAlert(){
        view.addSubview(alertView)
        alertView.center = view.center
    }
    
    
     func setupVisualEffectView(){
        view.addSubview(visualEffectView)
        NSLayoutConstraint.activate([
            visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        visualEffectView.alpha = 0
    }
    

    func animationAlertIn(){
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4 ) {
            self.visualEffectView.alpha = 1
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    
    func animationAlertOut(){
        
        UIView.animate(withDuration: 0.4 ) {
            self.visualEffectView.alpha = 0
            self.alertView.alpha = 0
            self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }
    }
    
    @IBAction func creatBattonPressad(_ sender: Any) {
        setAlert()
        animationAlertIn()
    }
    
    private func setSettings(){
        view.addSubview(settingsView)
        NSLayoutConstraint.activate([
            settingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            settingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            settingsView.topAnchor.constraint(equalTo: viewMenu.topAnchor,constant: 91),
            settingsView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 51),
            settingsView.widthAnchor.constraint(equalToConstant: 393),
            settingsView.heightAnchor.constraint(equalToConstant: 180)
        ])
        viewMenu.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 0)
    }
    
    func animationSettingsIn(){
        settingsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        settingsView.alpha = 0
        
        UIView.animate(withDuration: 0.4 ) {
            self.settingsView.alpha = 1
            self.settingsView.transform = CGAffineTransform.identity
            self.singUpView.alpha = 0
            self.ViewNoDocuments.alpha = 0
        }
    }
    
    func animationSettingsOut(){

        UIView.animate(withDuration: 0.4 ) {
            self.settingsView.alpha = 0
            self.settingsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.singUpView.alpha = 1
            self.ViewNoDocuments.alpha = 1
        }
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        
        if !isTapBatton {
            self.settingsView.alpha = 1
            animationSettingsIn()
            isTapBatton = true
            setSettings()
        }else {
            animationSettingsOut()
            self.settingsView.alpha = 0
            isTapBatton = false
        }
    }
}

extension MyFilesController: AlertCreateFolderDelegate {
    func cancelBtnTapped() {
        animationAlertOut()
    }
    
    func createBtnTapped() {
        print("create")
    }
}



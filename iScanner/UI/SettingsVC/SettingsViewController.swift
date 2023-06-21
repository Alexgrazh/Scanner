//
//  SettingsViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 11.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    

    @IBOutlet weak var navigationView: CustomNavigation!
    @IBOutlet weak var singUpBatton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    

    var arrayNameCell: [[SettingsModal]] = [[SettingsModal(textName: "Restore Purchase")],[SettingsModal(textName: "Add to Siri"),SettingsModal(textName: "Start  App with"),SettingsModal(textName: "Picture Quality"),SettingsModal(textName: "Appearance")],[SettingsModal(textName: "My Email")],[SettingsModal(textName: "Manage ios Subsriptions"),SettingsModal(textName: "Privacy Policy"),SettingsModal(textName: "Terms of Use")]]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.closeButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        buttonConfigure()
    
        makeTableView()
        
        setupNavigation()
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func buttonConfigure(){
        singUpBatton.layer.cornerRadius = 7
    }
    
   func makeTableView(){
       tableView.delegate = self
       tableView.dataSource = self
       
    }

    func setupNavigation(){
        navigationView.titleLabel.text = "Settings"
    }

}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.section == 2 {
            return 56.0
        }
        
        return 41
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "AddSiri") as! AddSiriViewController
        
                  navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 1
        }else if section == 3 {
            return 3
        }
        return arrayNameCell[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayNameCell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier:"SettingsCell" ,for: indexPath) as! SettingsTableViewCell
        
        cell.configure(with: arrayNameCell[indexPath.section][indexPath.row])
        
        
        cell.layer.cornerRadius = 10
        return cell
    }
}



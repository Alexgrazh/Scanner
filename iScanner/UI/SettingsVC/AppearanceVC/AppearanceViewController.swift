//
//  AppearanceViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class AppearanceViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationView: CustomNavigation!
    
    var contentData: [AppearanceModel] = [AppearanceModel(title: "System"),AppearanceModel(title: "Light"),AppearanceModel(title: "Dark")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeTableView()
        
        navigationView.titleLabel.text = "Appearance"
        navigationView.closeButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func makeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "AppearanceTableViewCell", bundle: nil), forCellReuseIdentifier: "apperenceCell")
    }
    
    
}

//MARK: - Table View
extension AppearanceViewController : UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension AppearanceViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "apperenceCell", for: indexPath) as! AppearanceTableViewCell
        
        cell.configure(with: contentData[indexPath.row])
        
        return cell
    }
    
    
}

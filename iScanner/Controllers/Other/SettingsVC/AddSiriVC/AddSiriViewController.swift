//
//  AddSiriViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 20.06.2023.
//

import UIKit

class AddSiriViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var contantData : [AddSiriModal] = [AddSiriModal(title: "Scan ocument"),AddSiriModal(title: "Scan ID"),AddSiriModal(title: "Scan Password"),AddSiriModal(title: "Scan QR Code"),AddSiriModal(title: "Open Math solver"),AddSiriModal(title: "Add from Photos"),AddSiriModal(title: "Open recent Document"),AddSiriModal(title: "Open Certain document or folder")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
        
    }

    func makeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - Table View
extension AddSiriViewController : UITableViewDelegate  {
    
    
}

extension AddSiriViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

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
    
    @IBOutlet weak var navigationView: CustomNavigation!
    
    var contantData : [AddSiriModal] = [AddSiriModal(title: "Scan ocument"),AddSiriModal(title: "Scan ID"),AddSiriModal(title: "Scan Password"),AddSiriModal(title: "Scan QR Code"),AddSiriModal(title: "Open Math solver"),AddSiriModal(title: "Add from Photos"),AddSiriModal(title: "Open recent Document"),AddSiriModal(title: "Open Certain document or folder")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
        
        navigationView.titleLabel.text = "Add to Siri"
        navigationView.closeButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            
        } 
    }

    func makeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "AddtoSiriTableViewCell", bundle: nil), forCellReuseIdentifier: "SiriCell")
    }

}

//MARK: - Table View
extension AddSiriViewController : UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension AddSiriViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contantData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SiriCell", for: indexPath) as! AddtoSiriTableViewCell
        
        cell.configure(with: contantData[indexPath.row])
        
        return cell
    }
    
    
}

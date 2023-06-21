//
//  PictureQualityViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class PictureQualityViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationView: CustomNavigation!

    var contentData : [PictureQualityModal] = [PictureQualityModal(title: "HD [300+dpi]", subTitle: "For Printing . Not Available for the original size"),PictureQualityModal(title: "High", subTitle: "For Important docs"),PictureQualityModal(title: "Medium", subTitle: "For  social media and messengers"),PictureQualityModal(title: "Low", subTitle: "For email attachments and small files")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeTableView()
        
        navigationView.titleLabel.text = "Picture Quality"
        navigationView.closeButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func makeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "PictureQualityTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
    }

}

//MARK: - Table View
extension PictureQualityViewController : UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension PictureQualityViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureQualityTableViewCell
        
        cell.configure(with: contentData[indexPath.row])
        
        return cell
    }
    
    
}

//
//  SettingsView.swift
//  iScanner
//
//  Created by Alex Grazhdan on 03.05.2023.
//

import UIKit

protocol SettingsViewDelegate {
    
}

class SettingsView: UIView {

//    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var settingsView: UIView!
    
    override  func awakeFromNib() {
        super .awakeFromNib()
//        collectionView.dataSource = self
//        collectionView.delegate = self
    }

}



//extension SettingsView : UICollectionViewDelegate{
//
//}
//
//extension SettingsView : UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
//
//        return cell
//    }
//
//}

//
//  StartAppWithViewController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 21.06.2023.
//

import UIKit

class StartAppWithViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationView: CustomNavigation!
    
//    var selectedItem: IndexPath?
    
    var selectedCells: [IndexPath] = []
    
    var contentData : [StartAppWithModal] = [StartAppWithModal(title: "Camera"), StartAppWithModal(title: "My Files")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
        
        navigationView.titleLabel.text = "Start App With"
        navigationView.closeButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }

    
    func makeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "StartAppTableViewCell", bundle: nil), forCellReuseIdentifier: "StartCell")
    }
    
   
    
}

//MARK: - Table View
extension StartAppWithViewController : UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //Потрібно тапати на комірку щоб зняти галочку//
//        if let cell = tableView.cellForRow(at: indexPath), let checkmarkImageView = cell.contentView.viewWithTag(100) as? UIImageView {
//               if selectedCells.contains(indexPath) {
//                   // Вибрана комірка вже була обрана, тому зніміть вибір і приховайте галочку
//                   if let index = selectedCells.firstIndex(of: indexPath) {
//                       selectedCells.remove(at: index)
//                   }
//                   checkmarkImageView.isHidden = true
//               } else {
//                   // Обрати комірку та показати галочку
//                   selectedCells.append(indexPath)
//                   checkmarkImageView.isHidden = false
//               }
//           }
           
        if let cell = tableView.cellForRow(at: indexPath), let checkmarkImageView = cell.contentView.viewWithTag(100) as? UIImageView {
               // Перевіряємо, чи вибрана комірка вже існує у selectedCells
               if selectedCells.contains(indexPath) {
                   // Вибрана комірка вже була обрана, тому знімаємо вибір та приховуємо галочку
                   if let index = selectedCells.firstIndex(of: indexPath) {
                       selectedCells.remove(at: index)
                   }
                   checkmarkImageView.isHidden = true
               } else {
                   // Знімаємо вибір та ховаємо галочку з попередньої комірки (якщо існує)
                   if let previousIndexPath = selectedCells.first {
                       if let previousCell = tableView.cellForRow(at: previousIndexPath), let previousCheckmarkImageView = previousCell.contentView.viewWithTag(100) as? UIImageView {
                           previousCheckmarkImageView.isHidden = true
                       }
                       selectedCells.removeFirst()
                   }

                   // Обираємо нову комірку та показуємо галочку
                   selectedCells.append(indexPath)
                   checkmarkImageView.isHidden = false
               }
           }
        
        
//        if let cell = tableView.cellForRow(at: indexPath), let checkmarkImageView = cell.contentView.viewWithTag(100) as? UIImageView {
//               if selectedCells.contains(indexPath) {
//                   // Комірка вже була вибрана, тому знімаємо вибір
//                   if let index = selectedCells.firstIndex(of: indexPath) {
//                       selectedCells.remove(at: index)
//                   }
//                   checkmarkImageView.isHidden = true
//               } else {
//                   // Обираємо комірку
//                   selectedCells.append(indexPath)
//                   checkmarkImageView.isHidden = false
//               }
//           }
        
        
           tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension StartAppWithViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StartCell", for: indexPath) as! StartAppTableViewCell
        
        cell.configure(with: contentData[indexPath.row])
        
        return cell
    }
    
    
}


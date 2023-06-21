//
//  ActionsController.swift
//  iScanner
//
//  Created by Alex Grazhdan on 25.04.2023.
//

import UIKit

class ActionsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iScanner"
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        self.navigationController?.title = "Action"
        self.navigationItem.title = "iScanner"
        }
    
}

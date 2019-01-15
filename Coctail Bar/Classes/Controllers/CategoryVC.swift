//
//  CategoryVC.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit
import MBProgressHUD

class CategoryVC: UITableViewController, MBProgressHUDDelegate {
    
    let progressBar = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        Api.shared.requestData(start: {
            progress.label.text = "Загружаю категории"
        }, downloadDrink: {
            progress.label.text = "Загружаю напитки"
            self.tableView.reloadData()
            progress.hide(animated: true)
        })
    }
}
    


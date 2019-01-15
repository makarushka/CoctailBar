//
//  CategoryExtension.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit


extension CategoryVC {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataSource.shared.data.keys.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 227.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoryCell else {return UITableViewCell()}
        for firstCategory in DataSource.shared.data.enumerated() {
            if firstCategory.offset == indexPath.row {
                cell.titleCategory.text = firstCategory.element.key.strCategory!
                cell.drinkAll = firstCategory.element.value
                cell.config()
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "segueProduct" {
//            let vc = segue.destination as? ProductVC
//            
//            for firstCategory in DataSource.shared.data.enumerated() {
//                if firstCategory.offset == self.tableView.indexPathForSelectedRow?.row {
//                    vc?.category = firstCategory.element.key
//                    self.present(vc!, animated: true, completion: nil)
//                }
//            }
//            
//        }
    }
    
}

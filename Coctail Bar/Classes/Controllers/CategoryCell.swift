//
//  CategoryCell.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit
import MBProgressHUD

class CategoryCell: UITableViewCell, UICollectionViewDataSource {
    
    
    var drinkAll: [Drink]?
    @IBOutlet weak var collectionProduct: UICollectionView!
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func config() {
        self.collectionProduct.dataSource = self
        self.collectionProduct.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinkAll!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellProduct", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        
        cell.drink = drinkAll![indexPath.row]
        cell.configure {
            print("Загружено")
        }
        
        return cell
    }
    
    

}

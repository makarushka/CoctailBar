//
//  ProductCell.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    var drink: Drink?
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    
    func configure(complite: @escaping ()->()) {
        guard let drink = self.drink else {return}
        DispatchQueue.global().async {
            Api.shared.requestImage(drink: drink) { image in
                DispatchQueue.main.async {
                self.imageProduct.image = image
                }
                
            }
        }
        self.titleProduct.text = drink.strDrink
    }
    
}

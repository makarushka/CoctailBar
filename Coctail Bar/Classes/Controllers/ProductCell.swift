//
//  ProductCell.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    
    override func prepareForReuse() {
        imageProduct.image = nil
        titleProduct.text = nil
        super.prepareForReuse()
    }
    
}

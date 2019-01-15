//
//  DataSource.swift
//  Coctail Bar
//
//  Created by Yuriy on 14/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import Foundation


class DataSource {
    static let shared = DataSource()
    
    var data: [DrinkCategory : [Drink]] = [:]
    
    private init() {}
}

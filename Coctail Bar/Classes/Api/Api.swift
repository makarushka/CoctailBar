    //
    //  API.swift
    //  Coctail Bar
    //var  //  Created by Yuriy on 14/01/2019.
    //  Copyright © 2019 Yuriy. All rights reserved.
    //
    
    import Foundation
    import Alamofire
    import UIKit
    final class Api {
        
        static let shared = Api()
        
        func requestData(start: @escaping () -> Void, downloadDrink: @escaping () -> ()) {
            guard let url = URL(string: BASE_URL_CATEGORY_STRING) else { return }
            request(url).response { (response) in
                start()
                guard let data = response.data else {return}
                DispatchQueue.global().sync {
                    do {
                        let category = try JSONDecoder().decode(BaseCategory.self, from: data)
                        
                        for categoryFirst in category.drinks! {
                            self.reqeustProduct(category: categoryFirst) {
                                DataSource.shared.data[categoryFirst] = $0
                                downloadDrink()
                            }
                        }
                    } catch {
                        print("Error decode category")
                    }
                }
                }.resume()
        }
        
        
        
        private func reqeustProduct(category: DrinkCategory, complition: @escaping (([Drink]) -> Void)) {
            let categoryUrl = category.strCategory!.replacingOccurrences(of: " ", with: "%20")
            let baseUrl = URL(string: "\(BASE_URL_PRODUCT_CATEGORY)\(categoryUrl)")
            guard let url = baseUrl else {return}
            request(url).response { (response) in
                guard let data = response.data else {return}
                
                do {
                    let productModel = try JSONDecoder().decode(BaseProduct.self, from: data)
                    DispatchQueue.global().sync {
                    complition(productModel.drinks!)
                    }
                } catch {
                    print("Error decode Drink")
                }
                
            }
        }
        
        
        func requestImage(drink: Drink, complition: @escaping (UIImage) -> Void) {
            guard let url = URL(string: drink.strDrinkThumb!) else {return}
            request(url).response {
                guard let data = $0.data else {return}
                    guard let image = UIImage(data: data) else {return}
                    complition(image)
            }
        }
    }
    
    
    

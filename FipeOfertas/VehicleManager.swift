//
//  VeiculoManager.swift
//  FipeOfertas
//
//  Created by Gaspar on 20/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class VehicleManager: NSObject {
    
    // this method returns all brands from api
    func loadBrands(callback: @escaping(_ brands:[Brand]?, _ error: Error?) ->()) {
        Alamofire.request("http://api.gasparteixeira.com.br/marcas/carros").responseJSON {
            response
            in
            
            var brands = [Brand]()
            let json = JSON(response.result.value!)

            for(_, subJSON): (String, JSON) in json {
                let brand = Brand(idBrand: subJSON["id"].int,
                                name: subJSON["name"].string,
                                fipeName: subJSON["fipe_name"].string,
                                order: subJSON["order"].int,
                                key: subJSON["key"].string)
                
                brands.append(brand)
            }
            
            callback(brands, json.error)
        }
    }
    
}

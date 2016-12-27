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
    var typeVehicle: String!
    var brand: Int!
    var model: String!
    var vehicle: Int!
    var year: String!
    var nameVehicle: String!
    
    // this method returns all brands from api
    func loadBrands(callback: @escaping(_ brands:[Brand]?, _ error: Error?) ->()) {
        
        UIView.showLoading()
        
        let endpoint:String = "http://api.gasparteixeira.com.br/marcas/" + typeVehicle
        Alamofire.request(endpoint).responseJSON {
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
            
            UIView.removeLoading()
            
            callback(brands, json.error)
        }
    }
    
    func loadModels(callback: @escaping(_ models:[Model]?, _ error: Error?) ->()) {
        
        UIView.showLoading()
        
        Alamofire.request("http://api.gasparteixeira.com.br/veiculos/\(String(brand))").responseJSON {
            response
            in
            
            var models = [Model]()
            let json = JSON(response.result.value!)

            for(_, subJSON): (String, JSON) in json {
                let model = Model(idBrand: Int(subJSON["idMarca"].string!),
                                  idModel: Int(subJSON["idModelo"].string!),
                                  name: subJSON["modelo"].string,
                                  fipeBrand: subJSON["marca"].string)
                
                models.append(model)
            }
         
            UIView.removeLoading()
            callback(models, json.error)
        }
    }
    
    func loadVehicles(callback: @escaping(_ models:[Model]?, _ error: Error?) ->()) {
        
        UIView.showLoading()
        
        let endpoint: String = "http://api.gasparteixeira.com.br/modelos/" + String(brand) + "/" + model
        Alamofire.request(endpoint).responseJSON {
            response
            in
            
            var models = [Model]()
            let json = JSON(response.result.value!)

            for(_, subJSON): (String, JSON) in json {
                let model = Model(idBrand: Int(subJSON["idMarca"].string!),
                                  idModel: Int(subJSON["idModelo"].string!),
                                  name: subJSON["modelo"].string,
                                  fipeBrand: subJSON["marca"].string)
                
                models.append(model)
            }
            
            UIView.removeLoading()
            callback(models, json.error)
        }
    }
    
    func loadTypes(callback: @escaping(_ types:[Type]?, _ error: Error?) ->()) {
        
        UIView.showLoading()
        
        let endpoint: String = "http://api.gasparteixeira.com.br/veiculo/" + String(brand) + "/" + String(vehicle)
        Alamofire.request(endpoint).responseJSON {
            response
            in
            
            var types = [Type]()
            let json = JSON(response.result.value!)
            
            for(_, subJSON): (String, JSON) in json {
                let type = Type(idType: subJSON["id"].string,
                                  name: subJSON["veiculo"].string,
                                  yearFuel: subJSON["name"].string,
                                  brand: subJSON["marca"].string,
                                  fipeCode: subJSON["fipe_codigo"].string,
                                  fipeBrand: subJSON["fipe_marca"].string)
                
                types.append(type)
            }
            
            UIView.removeLoading()
            callback(types, json.error)
        }
    }
    
    func loadVehicle(callback: @escaping(_ vehicles:[Vehicle]?, _ error: Error?) ->()) {
        
        UIView.showLoading()
        
        let endpoint: String = "http://api.gasparteixeira.com.br/veiculo/" + String(brand) + "/" + String(vehicle) + "/" + year
        Alamofire.request(endpoint).responseJSON {
            response
            in
            
            var vehicles = [Vehicle]()
            let json = JSON([response.result.value])

            for(_, subJSON): (String, JSON) in json {

                let vehicle = Vehicle(idVehicle: Int(subJSON["id"].string!),
                                reference: subJSON["referencia"].string,
                                fipeCode: subJSON["fipe_codigo"].string,
                                name: subJSON["name"].string,
                                fuel: subJSON["combustivel"].string,
                                brand: subJSON["marca"].string,
                                yearModel: subJSON["ano_modelo"].string,
                                price: subJSON["preco"].string,
                                key: subJSON["key"].string,
                                vehicle: subJSON["veiculo"].string)
                
                vehicles.append(vehicle)
            }
            
            UIView.removeLoading()
            callback(vehicles, json.error)
        }
    }
    
    func loadOferta(callback: @escaping(_ offers:[Offer]?, _ error: Error?) ->()) {
        UIView.showLoading()
        let replaced = nameVehicle.replacingOccurrences(of: "/", with: "_")
        let replaced2 = replaced.replacingOccurrences(of: ".", with: "_")
        let replaced3 = replaced2.replacingOccurrences(of: " ", with: "_")
        let endpoint: String = "http://api.gasparteixeira.com.br/mercado/" + replaced3
        Alamofire.request(endpoint).responseJSON {
            response
            in
            
            var offers = [Offer]()
            let json = JSON(response.result.value!)
            
            for(_, subJSON): (String, JSON) in json {
                
                let offer = Offer(idVehicle: subJSON["idVehicle"].string,
                                  reference: subJSON["reference"].string,
                                  fipeCode: subJSON["fipeCode"].string,
                                  name: subJSON["name"].string,
                                  fuel: subJSON["fuel"].string,
                                  brand: subJSON["brand"].string,
                                  yearModel: subJSON["ano_modelo"].string,
                                  price: subJSON["price"].string,
                                  key: subJSON["key"].string,
                                  vehicle: subJSON["vehicle"].string,
                                  image: subJSON["image"].string)
                
                offers.append(offer)
            }
            UIView.removeLoading()
            callback(offers, json.error)
        }
    }
    
}

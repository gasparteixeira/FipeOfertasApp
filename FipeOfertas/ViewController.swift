//
//  ViewController.swift
//  FipeOfertas
//
//  Created by Gaspar on 19/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brands = [Brand]()
    
    func loadBrand() {
        let vehicleManager = VehicleManager()
        
        vehicleManager.loadBrands{ (brands, error) in
            if error == nil {
                if let array = brands {
                    print(array) // escrevendo as marcas
                    self.brands = array
                }
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadBrand();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


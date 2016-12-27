//
//  VeiculoViewController.swift
//  FipeOfertas
//
//  Created by Gaspar on 06/12/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class VeiculoViewController: UIViewController {
    
    var selectedType: Type!
    var selectedModel: Int!
    var selectedBrand: Int!
    var vehicles = [Vehicle]()
    var vehicleName: String!
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbReference: UILabel!
    @IBOutlet weak var lbFuel: UILabel!
    @IBOutlet weak var lbBrand: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbVehicle: UILabel!
    
    
    func loadVehicle() {
        
        let vehicleManager = VehicleManager()
        vehicleManager.year = selectedType.idType
        vehicleManager.vehicle = selectedModel
        vehicleManager.brand = selectedBrand
        
        vehicleManager.loadVehicle { (vehicles, error) in
            if error == nil {
                if let array = vehicles {
                    self.vehicles = array
                    self.lbName.text = array[0].name
                    self.vehicleName = array[0].name
                    self.lbReference.text = array[0].reference
                    self.lbFuel.text = array[0].fuel
                    self.lbBrand.text  = array[0].brand
                    self.lbPrice.text = array[0].price
                    self.lbVehicle.text = array[0].vehicle
                }
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Veículo"
        loadVehicle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showOfertas(_ sender: Any) {
        self.performSegue(withIdentifier: "showOferta", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOferta" {
            let destination = segue.destination as? OfertaViewController
            destination?.selectedName = self.vehicleName
        }
    }

}

//
//  ViewController.swift
//  FipeOfertas
//
//  Created by Gaspar on 19/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    
    var brands = [Brand]()
    
    var pickerData: Brand!
    
    var typeVehicle: String = "carros"
    
    @IBOutlet weak var label: UILabel!
    
    func loadBrand() {
        
        let vehicleManager = VehicleManager()
        
        vehicleManager.typeVehicle = typeVehicle

        vehicleManager.loadBrands{ (brands, error) in
            if error == nil {
                if let array = brands {
                    self.brands = array
                    self.pickerData = array[0]
                    self.pickerView.dataSource = self
                    self.pickerView.delegate = self
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBrand()
        self.title = "Marcas"
    }
    
    
    @IBAction func mostraMarca(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMarca", sender: pickerData)
    }

    
    @IBAction func sementedChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 1:
            typeVehicle = "motos"
        case 2:
            typeVehicle = "caminhoes"
        default:
            typeVehicle = "carros"
        }
        loadBrand()
        
    }
    func segmentedDidChange(_ sender: UISegmentedControl) {
       
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.brands[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brands.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerData = self.brands[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showMarca" {
            let marcaViewController = segue.destination  as! MarcaViewController

            if let brand = sender as? Brand {
                marcaViewController.brandSelected = brand
            }
        }
    }

}


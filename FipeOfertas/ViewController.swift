//
//  ViewController.swift
//  FipeOfertas
//
//  Created by Gaspar on 19/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit
import UIDropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    var brands = [Brand]()
    var ordenedBrands = [String]()
    var drop: UIDropDown!
    
    @IBOutlet weak var label: UILabel!
    
    func loadBrand() {
        let vehicleManager = VehicleManager()
        
        vehicleManager.loadBrands{ (brands, error) in
            if error == nil {
                if let array = brands {
                    self.brands = array
                    self.createDropDown()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBrand()

    }
    
    func createDropDown() {
        for brand in self.brands {
            self.ordenedBrands.append(brand.name!)
        }
        
        drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 280, height: 40))
        drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 50)
        drop.placeholder = "Selecione a marca..."
        drop.options = self.ordenedBrands
        drop.borderColor = .darkGray
        drop.tableHeight = self.view.frame.midY
        drop.rowHeight = 40
        drop.didSelect { (option, index) in
            self.label?.text = "You just select \(option)  at index: \(index)"
            print("You just select: \(option) at index: \(index)")
        }
        self.view.addSubview(drop)
        
        segmented.addTarget(self, action: #selector(ViewController.segmentedDidChange(_:)), for: .valueChanged)
    }
    
    func segmentedDidChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        drop.animationType = UIDropDownAnimationType(rawValue: index)!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


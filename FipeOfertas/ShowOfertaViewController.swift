//
//  ShowOfertaViewController.swift
//  FipeOfertas
//
//  Created by Gaspar on 13/12/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ShowOfertaViewController: UIViewController {
    
    var oferta: Offer?

    @IBOutlet weak var nomeOferta: UILabel!
    
    @IBOutlet weak var infoOferta: UILabel!
    
    @IBOutlet weak var imageOferta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.nomeOferta.text = oferta?.name
        self.infoOferta.text = oferta?.price
        
        let url = NSURL(string:(oferta?.image)!)
        let data = NSData(contentsOf:url! as URL)
        
        // It is the best way to manage nil issue.
        if (data?.length)! > 0 {
            imageOferta.image = UIImage(data:data! as Data)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

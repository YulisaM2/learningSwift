//
//  ViewController.swift
//  ActClaseStoryboardsE20
//
//  Created by Yolanda Martinez on 25/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNombreVC: UILabel!
    @IBOutlet weak var tfCelularVC: UITextField!
    @IBOutlet weak var imgFotoVC: UIImageView!
    
    var nombreVC : String!
    var celularVC : String!
    var fotoVC : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfCelularVC.text = celularVC
        imgFotoVC.image = fotoVC
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "azul"{
            //
        }else{
            let vista = segue.destination as! ViewControllerVerde
            vista.celularVV = tfCelularVC.text
        }
    }
    
    
    @IBAction func unwindVerde(for unwindSegue: UIStoryboardSegue) {
        tfCelularVC.text = celularVC
        imgFotoVC.image = fotoVC
    }
    
    @IBAction func unwindAzul(for unwindSegue: UIStoryboardSegue) {
        lbNombreVC.text = nombreVC
    }

}


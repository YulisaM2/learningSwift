//
//  ViewController.swift
//  helloWorld
//
//  Created by Alumno on 10/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var lbMensaje: UILabel!
   
    @IBAction func botonSaludar(_ sender: UIButton) {
        lbMensaje.text = "Hola " + tfNombre.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


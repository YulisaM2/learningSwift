//
//  ViewControllerEsfera.swift
//  cuerposGeometricos_a01570056
//
//  Created by Trinity on 28/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewControllerEsfera: UIViewController {
    
    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var imgEsfera: UIImageView!
    
    var radioVE : Double!
    var volumenVE : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Double(tfRadio.text!) != nil{
            
            return true

        }else{
            // No lleno el dato antes de querer generar el reporte, por lo que hay que mostrar un error
                       let alerta = UIAlertController(title: "Error!", message: "Favor de introducir el radio correctamente", preferredStyle: .alert)
                       
                       let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       
                       alerta.addAction(accion)
                       present(alerta,animated: true, completion: nil)
            
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        radioVE = Double(tfRadio.text!)
        volumenVE = (4 * Double.pi * pow(radioVE,3)) / 3
        
        let vista = segue.destination as! ViewController
        
        vista.figuraVP = imgEsfera.image
        vista.medidasVP = "Radio: " + tfRadio.text!
        vista.volumenVP = String(volumenVE)
        
    }
}

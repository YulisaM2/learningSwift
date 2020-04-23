//
//  ViewController.swift
//  Divisas_a01570056
//
//  Created by A01570056 on 13/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfTipoCambio: UITextField!
    @IBOutlet weak var tfDolares: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    
    @IBOutlet weak var imgDinero: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgDinero.image = UIImage(named: "simbolo")
    }

    
    
    @IBAction func calcularDolares(_ sender: UIButton) {
        if let tipoCambio = Double(tfTipoCambio.text!),
            let pesos = Double(tfPesos.text!){
                
            let dolares = pesos / tipoCambio
            tfDolares.text = "\(dolares)"
        }
        else{
            let alerta = UIAlertController(title: "Error", message: "Los campos deben de tener valores numéricos", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            
            present(alerta, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
}


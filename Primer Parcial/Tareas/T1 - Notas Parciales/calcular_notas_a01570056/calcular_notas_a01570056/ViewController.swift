iC//
//  ViewController.swift
//  calcular_notas_a01570056
//
//  Created by Trinity on 19/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbCalificaciones: UILabel!
    
    @IBOutlet weak var imgExamen: UIImageView!
    
    @IBOutlet weak var lbParciales: UILabel!
    @IBOutlet weak var tfParciales: UITextField!
    @IBOutlet weak var lbActividades: UILabel!
    @IBOutlet weak var tfActividades: UITextField!
    
    @IBOutlet weak var bQueCalc: UIButton!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var tfResultado: UITextField!
    
    @IBOutlet weak var lbExamenFinal: UILabel!
    @IBOutlet weak var tfExamenFinal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbExamenFinal.isHidden = true
        tfExamenFinal.isHidden = true
    }
    
    @IBOutlet weak var swCalcTipo: UISwitch!
    @IBAction func calcResultado(_ sender: UIButton) {
        if(!swCalcTipo.isOn){
            if let parciales = Double(tfParciales.text!),
                   let actividades = Double(tfActividades.text!),
                   let examenFinal = Double(tfExamenFinal.text!){
                           let resultado = (parciales * 0.50) + (actividades * 0.20) + (examenFinal * 0.30)
                           tfResultado.text = "\(resultado)"
                   }else{
                       let alerta = UIAlertController(title: "Error", message: "Los campos deben de tener dato", preferredStyle: .alert)
                       let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       
                       alerta.addAction(accion)
                       present(alerta, animated: true, completion: nil)
                   }
        }else{
            if let parciales = Double(tfParciales.text!),
                let actividades = Double(tfActividades.text!){
                let resultado = abs(((parciales * 0.50) + (actividades * 0.20) - 70) / 0.30)
                tfResultado.text = "\(resultado)"
            }else{
                let alerta = UIAlertController(title: "Error", message: "Los campos deben de tener dato", preferredStyle: .alert)
                           let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                           
                           alerta.addAction(accion)
                           present(alerta, animated: true, completion: nil)
            }
        }
       
    }
    
    @IBAction func swCambioCalc(_ sender: UISwitch) {
        // borrar textos al cambiar de metodo
        tfResultado.text = ""
        tfParciales.text = ""
        tfActividades.text = ""
        tfExamenFinal.text = ""
        
        if(sender.isOn){
            // calc nota pasar
            bQueCalc.setTitle("Calcula Nota Pasar", for: .normal)
            lbResultado.text = "Nota para pasar"
            lbExamenFinal.isHidden = true
            tfExamenFinal.isHidden = true
        }else{
            // calc nota final
            bQueCalc.setTitle("Calcula Nota Final", for: .normal)
            lbResultado.text = "Nota final"
            lbExamenFinal.isHidden = false
            tfExamenFinal.isHidden = false
        }
    }
    

    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}


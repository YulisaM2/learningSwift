//
//  ViewControllerPrisma.swift
//  cuerposGeometricos_a01570056
//
//  Created by Trinity on 28/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewControllerPrisma: UIViewController {

    @IBOutlet weak var imgPrisma: UIImageView!
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    
    var largoVP : Double!
    var anchoVP : Double!
    var alturaVP : Double!
    var volumenVE : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (Double(tfLargo.text!) != nil) &&
        (Double(tfAncho.text!) != nil) &&
            (Double(tfAltura.text!) != nil) {
            
            return true
            
        }else{
            // No llenaron los datos antes de querer generar el reporte, por lo que hay que mostrar un error
                       let alerta = UIAlertController(title: "Error!", message: "Favor de introducir todas las medias correctamente", preferredStyle: .alert)
                       
                       let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       
                       alerta.addAction(accion)
                       present(alerta,animated: true, completion: nil)
               
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        largoVP = Double(tfLargo.text!)
        anchoVP = Double(tfAncho.text!)
        alturaVP = Double(tfAltura.text!)
            
        volumenVE = largoVP * anchoVP * alturaVP

        let vista = segue.destination as! ViewController
            
        vista.figuraVP = imgPrisma.image
        vista.medidasVP = "Altura: " + tfLargo.text! + "\n" + "Ancho: " + tfAncho.text! + "\n" + "Altura: " + tfAltura.text!
            
        vista.volumenVP = String(volumenVE)
        
    }
    

}

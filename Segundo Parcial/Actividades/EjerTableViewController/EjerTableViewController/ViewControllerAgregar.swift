//
//  ViewControllerAgregar.swift
//  EjerTableViewController
//
//  Created by Trinity on 26/03/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

protocol protocoloAgregarJugador {
    func agregaJugador(jug : Jugador) -> Void
}

class ViewControllerAgregar: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfPuntos: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
   
    var delegado : protocoloAgregarJugador!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func guardarJugador(_ sender: UIButton) {
        
        if let nom = tfNombre.text,
            let punt = Int(tfPuntos.text!),
            let ema = tfEmail.text{
            
            let unJugador = Jugador(nombre: nom, puntos: punt, email: ema, foto: nil)
            
            delegado.agregaJugador(jug: unJugador)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

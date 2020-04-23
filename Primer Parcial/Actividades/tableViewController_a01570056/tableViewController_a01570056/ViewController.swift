//
//  ViewController.swift
//  tableViewController_a01570056
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgPersona: UIImageView!
    
    @IBOutlet weak var lbNombre: UILabel!
    
    @IBOutlet weak var lbCorreo: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    
    var jugador : Jugador!
    var imgPersonaVC : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgPersona.image = imgPersonaVC
        lbNombre.text = "Nombre : " + jugador.nombre
        lbCorreo.text = "Correo : " + jugador.email
        lbPuntos.text = "Puntos : " + String(jugador.puntos)
        
        title = "Info. Jugador"
    }


}


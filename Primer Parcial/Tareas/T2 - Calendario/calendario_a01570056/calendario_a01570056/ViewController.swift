//
//  ViewController.swift
//  calendario_a01570056
//
//  Created by Trinity on 20/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // En caso de que cambie de dia, es necesario saber mi origen para poder regresar a el si es necesario
    let formato = DateFormatter()
    var diaAnterior = Date()
    var hoy = Date()
    var fecha = String()
    var fechaComponentes = Array<Substring>()
    
    @IBOutlet weak var lbAnho: UILabel!
    @IBOutlet weak var lbMes: UILabel!
    @IBOutlet weak var lbDia: UILabel!
    @IBOutlet weak var lbSemana: UILabel!
    
    func actualizarLabels(){
        fecha = formato.string(from: hoy)
        fechaComponentes = fecha.split(separator: " ")
        lbAnho.text = String(fechaComponentes[0])
        lbMes.text = String(fechaComponentes[1])
        lbDia.text = String(fechaComponentes[2])
        lbSemana.text = String(fechaComponentes[3])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Cuando empieza, la primera instancia de la pantalla debe de imprimir la fecha de hoy
        // Year Month Day Weekday separados por un espacio en blanco para facilitar la asignacion de los labels
        formato.dateFormat = "yyyy MMMM d EEEE"
        actualizarLabels()
    }
    
    // Siguiente dia
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        diaAnterior = hoy
        // Incrementar un dia, como el parametros esta en segundos se necesita hacer la conversion a un dia
        hoy = hoy.addingTimeInterval(60 * 60 * 24)
        actualizarLabels()
    }
    
    // Dia anterior
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        diaAnterior = hoy
        hoy = hoy.addingTimeInterval(-60 * 60 * 24)
        actualizarLabels()
    }


}


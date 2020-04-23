//
//  ViewController.swift
//  tableView_a01570056
//
//  Created by Alumno on 02/03/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var lista = ["a","b","c","d","e","f"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Lista Datos"
    }

    // MARK: - Metodos de Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        
        celda.textLabel?.text = lista[indexPath.row]
        celda.textLabel?.textColor  = UIColor.gray
        let tipoLetra = UIFont(name: "Palatino", size: 30)
        celda.textLabel?.font = tipoLetra
        
        celda.detailTextLabel?.text = "\(indexPath.row)"
        celda.imageView?.image = UIImage(named: "redbutton")
        
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaDetalle = segue.destination as! ViewControllerDetalle
        
        let indice = tableView.indexPathForSelectedRow!
        
        vistaDetalle.datoMostrar = lista[indice.row]
    }
}


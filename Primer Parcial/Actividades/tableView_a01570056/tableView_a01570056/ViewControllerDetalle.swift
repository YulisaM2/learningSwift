//
//  ViewControllerDetalle.swift
//  tableView_a01570056
//
//  Created by Alumno on 02/03/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerDetalle: UIViewController {

    @IBOutlet weak var lbEditar: UILabel!
    
    var datoMostrar : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbEditar.text = datoMostrar
        title = "Detalle"
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

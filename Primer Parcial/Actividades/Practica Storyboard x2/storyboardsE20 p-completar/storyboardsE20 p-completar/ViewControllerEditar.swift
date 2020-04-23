//
//  ViewControllerEditar.swift
//  storyboardsE20 p-completar
//
//  Created by Trinity on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerEditar: UIViewController {
    @IBOutlet weak var tfNombreVE: UITextField!
    @IBOutlet weak var tfMailVE: UITextField!
    
    var nombreVE : String!
    var mailVE : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfNombreVE.text = nombreVE
        tfMailVE.text = mailVE
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tfNombreVE.text! == "" || tfMailVE.text! == ""{
            let alerta = UIAlertController(title: "Error!", message: "Favor de llenar ambos campos", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta,animated: true, completion: nil)
            
            return false
        }else{
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaPrincipal = segue.destination as! ViewController
        
        vistaPrincipal.nombreVC = tfNombreVE.text
        vistaPrincipal.mailVC = tfMailVE.text
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

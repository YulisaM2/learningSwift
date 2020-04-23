//
//  ViewController.swift
//  storyboardsE20 p-completar
//
//  Created by Yolanda Martinez on 24/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDonald: UIImageView!
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfMail: UITextField!
    
    var nombreVC : String!
    var mailVC : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "info"{
            let vistaInfo = segue.destination as! ViewControllerInformacion
            
            vistaInfo.imgVI = imgDonald.image
            vistaInfo.anchoVI = imgDonald.frame.size.width
            vistaInfo.alturaVI = imgDonald.frame.size.height
        }else{
            let vistaEditar = segue.destination as! ViewControllerEditar
            
            vistaEditar.nombreVE = tfNombre.text!
            vistaEditar.mailVE = tfMail.text!
        }
    }

    @IBAction func unwindDesdeEditarAPrincipal(for unwindSegue: UIStoryboardSegue) {
        
        tfNombre.text = nombreVC
        tfMail.text = mailVC
    }
}


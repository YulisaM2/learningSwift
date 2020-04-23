//
//  ViewController.swift
//  storyboardsE20 p-completar
//
//  Created by Yolanda Martinez on 24/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgfoto: UIImageView!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfMail: UITextField!
    var nombre : String!
    var email : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindEditar(unwindSegue: UIStoryboardSegue){
        tfNombre.text = nombre
        tfMail.text = email
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "info"{
            let vistaInfo = segue.destination as! ViewControllerInfo
            vistaInfo.foto = imgfoto.image
            vistaInfo.ancho = imgfoto.frame.size.width
            vistaInfo.altura = imgfoto.frame.size.height
        }else{
            let vistaEditar = segue.destination as! ViewControllerEditar
            vistaEditar.nombre = tfNombre.text!
            vistaEditar.email = tfMail.text!
        }
        
    }
}


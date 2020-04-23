//
//  ViewController.swift
//  cuerposGeometricos_a01570056
//
//  Created by Trinity on 28/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgFiguraVP: UIImageView!
    @IBOutlet weak var lbMedidas: UILabel!
    @IBOutlet weak var lbVolumen: UILabel!
    
    @IBOutlet weak var bInicio: UIButton!
    
    
    var medidasVP : String!
    var volumenVP : String!
    var figuraVP : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        imgFiguraVP.image = figuraVP
        lbMedidas.text = medidasVP
        lbVolumen.text = volumenVP
    }
    
    
    @IBAction func reiniciarValores(_ sender: UIButton) {
        
        // Mark : CHECAR ESTO DE IMAGEN VACIA
        imgFiguraVP.image = nil
        lbMedidas.text = ""
        lbVolumen.text = ""
    }
    
}


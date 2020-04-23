//
//  ViewController.swift
//  act_paisajes_a01570056
//
//  Created by Trinity on 30/03/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloMandarFoto {
   
    @IBOutlet weak var imgFoto: UIImageView!
    
    func mandarFoto(foto: UIImage){
        imgFoto.image = foto
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista = segue.destination as! ViewControllerFotos
        vista.delegado = self
    }
}


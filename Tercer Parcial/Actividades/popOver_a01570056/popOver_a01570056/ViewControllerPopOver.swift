//
//  ViewControllerPopOver.swift
//  popOver_a01570056
//
//  Created by Trinity on 14/05/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewControllerPopOver: UIViewController {

    @IBOutlet weak var tfDato: UITextField!
    var dato : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preferredContentSize = CGSize(width: 300, height: 200)
        tfDato.text = dato
    }
    
    @IBAction func datoIngresado(_ sender: UIButton) {
        let vista = presentingViewController as! ViewController
        vista.dato = tfDato.text!
        vista.actualizarDato()
        dismiss(animated: true, completion: nil)
    }
    
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}

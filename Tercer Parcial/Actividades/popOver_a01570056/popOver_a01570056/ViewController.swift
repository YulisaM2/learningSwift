//
//  ViewController.swift
//  popOver_a01570056
//
//  Created by Trinity on 14/05/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var lbDato: UILabel!
    var dato : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func actualizarDato(){
        lbDato.text = dato
    }
    
    func adaptivePresentationStyle (for controller:
    UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPopOver = segue.destination as! ViewControllerPopOver
        vistaPopOver.popoverPresentationController!.delegate = self
        
        vistaPopOver.dato = lbDato.text!
    }
}


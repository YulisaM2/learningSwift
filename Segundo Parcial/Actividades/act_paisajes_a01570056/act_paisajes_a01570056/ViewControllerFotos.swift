//
//  ViewControllerFotos.swift
//  act_paisajes_a01570056
//
//  Created by Trinity on 30/03/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

protocol protocoloMandarFoto{
    func mandarFoto(foto : UIImage) ->Void
}

class ViewControllerFotos: UIViewController {

    var delegado : protocoloMandarFoto!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seleccionarFoto(_ sender: UIButton) {
        let foto = sender.currentBackgroundImage!
        delegado.mandarFoto(foto: foto)
        dismiss(animated: true, completion: nil)
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

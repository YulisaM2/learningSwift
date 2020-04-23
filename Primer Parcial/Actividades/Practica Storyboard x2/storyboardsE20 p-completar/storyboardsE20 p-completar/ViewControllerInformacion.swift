//
//  ViewControllerInformacion.swift
//  storyboardsE20 p-completar
//
//  Created by Trinity on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerInformacion: UIViewController {

    @IBOutlet weak var imgDonald: UIImageView!
    @IBOutlet weak var lbAncho: UILabel!
    @IBOutlet weak var lbAltura: UILabel!
    
    var imgVI : UIImage!
    var anchoVI : CGFloat!
    var alturaVI : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgDonald.image = imgVI
        lbAncho.text = String(describing: anchoVI!)
        lbAltura.text = String(describing: alturaVI!)
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

//
//  ViewControllerVerde.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerVerde: UIViewController {

    @IBOutlet weak var tfCelularVV: UITextField!
    @IBOutlet weak var imgFotoVV: UIImageView!
    
    var celularVV : String!
    var fotoVV : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCelularVV.text = celularVV
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vista = segue.destination as! ViewController
        
        vista.celularVC = tfCelularVV.text
        vista.fotoVC = imgFotoVV.image
    }
    

}

//
//  Empleado.swift
//  masTableViews_a01570056
//
//  Created by Trinity on 16/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class Empleado: NSObject {
    
    var nombre : String
    var sueldo : Float
    var foto : UIImage!
    var departamento : String
    
    init(nombre : String, sueldo : Float, departamento : String, foto : UIImage){
        self.nombre = nombre
        self.sueldo = sueldo
        self.foto = foto
        self.departamento = departamento
    }

}

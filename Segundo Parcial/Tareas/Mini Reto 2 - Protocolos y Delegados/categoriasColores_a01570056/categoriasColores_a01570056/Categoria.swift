//
//  Categoria.swift
//  categoriasColores_a01570056
//
//  Created by Trinity on 12/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class Categoria: NSObject {

    var titulo : String = ""
    var color : UIColor = UIColor.black
    
    init(titulo: String, color: UIColor){
        self.titulo = titulo
        self.color = color
    }
    
}

//
//  ViewController.swift
//  slotMachine_a01570056
//
//  Created by Trinity on 27/03/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    // MARK: - PICKER DATA SOURCE
    // Solo necesitamos 3 ruletas (componentes)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // La cantidad de fotos por ruleta son el tamano del renglon de la matriz de fotos
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconsRuletas[component].count
       }
    
    // MARK: - Dimensiones de los segmentos
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
           
    // MARK: - PICKER DELEGATE ARREGLAR QUE SALGAN LAS FOTOS
 
    // Usado para regresar los textos de los iconos (modo debug con string)
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        return textosRuletas[component][row]
//    }
    
    // Regresar las imagenes (en formato UIView) de los iconos
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        // Hacer que cada icono sea de las mismas dimensiones
        let vIcono = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 110))
        
        vIcono.image = iconsRuletas[component][row]

        return vIcono
    }
    
    
    @IBOutlet weak var lbGano: UILabel!
   
    // Ruletas de 3 compontentes con fotos
    @IBOutlet weak var pRuleta: UIPickerView!
    
   // var textosRuletas = [[String]]()
    var iconsRuletas = [[UIImage]]()
    
    func girarRuletas(uno : Int, dos : Int, tres : Int){
        pRuleta.selectRow(uno, inComponent: 0, animated: true)
        pRuleta.selectRow(dos, inComponent: 1, animated: true)
        pRuleta.selectRow(tres, inComponent: 2, animated: true)
    }
    
    // Hacer que los picker empiecen con la misma imagen cuando empieza el juego
    func reiniciarPickers(){
        girarRuletas(uno: 0, dos: 0, tres: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbGano.isHidden = true
      
        self.pRuleta.delegate = self
        self.pRuleta.dataSource = self
        
        // Cargar a la matriz los iconos, cada renglon es una columna del picker (una ruleta)
        iconsRuletas = [[UIImage(named: "watermelon")!, UIImage(named: "cherry")!, UIImage(named: "crown")!, UIImage(named: "grape")!], [UIImage(named: "watermelon")!, UIImage(named: "cherry")!, UIImage(named: "crown")!, UIImage(named: "grape")!], [UIImage(named: "watermelon")!, UIImage(named: "cherry")!, UIImage(named: "crown")!, UIImage(named: "grape")!]]
                
//        textosRuletas = [["watermelon", "cherry", "crown"], ["watermelon", "cherry", "crown"], ["watermelon", "cherry", "crown"]]
        
        reiniciarPickers()
        pRuleta.isUserInteractionEnabled = false
    }
    
    
    func checarGanar()->Bool{
        
        if pRuleta.selectedRow(inComponent: 0) == pRuleta.selectedRow(inComponent: 1) && pRuleta.selectedRow(inComponent: 1) == pRuleta.selectedRow(inComponent: 2)
        {
            return true
        }
        
        return false
        
    }
    
    @IBAction func turnoGirar(_ sender: UIButton) {
       
        // En caso de que le piquen a Go sin hacer reset y ganaron, necesitamos esconder el texto de que ganaron antes
        lbGano.isHidden = true
        
        // Selecionando item al azar
        let currCompUno = Int.random(in: 0..<iconsRuletas[0].count)
        let currCompDos = Int.random(in: 0..<iconsRuletas[1].count)
        let currCompTres = Int.random(in: 0..<iconsRuletas[2].count)
        
        // Girar componentes con animacion
        girarRuletas(uno: currCompUno, dos: currCompDos, tres: currCompTres)
        
        if checarGanar()
        {
            lbGano.isHidden = false
        }
        else
        {
            lbGano.isHidden = true
        }
        
    }
    
    @IBAction func reiniciarJuego(_ sender: UIButton) {
        
        lbGano.isHidden = true
        reiniciarPickers()
    }
    

}


//
//  ViewController.swift
//  mastermind_a01570056
//
//  Created by Trinity on 25/02/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scTipoJuego: UISegmentedControl!
    @IBOutlet weak var viewRespuesta: UIView!
    @IBOutlet weak var lbAdivina: UILabel!
    @IBOutlet weak var viewIntentoActual: UIView!
    @IBOutlet weak var bIniciar: UIButton!
    @IBOutlet weak var bProbar: UIButton!
    @IBOutlet weak var viewEstadoTablero: UIView!
    
    // Imagenes de la secuencia de respuesta
    @IBOutlet weak var imgResPrimer: UIImageView!
    @IBOutlet weak var imgResSeg: UIImageView!
    @IBOutlet weak var imgResTer: UIImageView!
    @IBOutlet weak var imgResCuart: UIImageView!

    // Botones de la secuencia del usuario
    @IBOutlet weak var bIntenPrimer: UIButton!
    @IBOutlet weak var bIntenSeg: UIButton!
    @IBOutlet weak var bIntenTer: UIButton!
    @IBOutlet weak var bIntenCuart: UIButton!
    
    // Variables para el manejo de los turnos
    var intentos : Int!
    @IBOutlet weak var lbIntentos: UILabel!
    var esferas : Array<UIImage> = []
    var currOpcionIntenPrimer : Int!
    var currOpcionIntenSeg : Int!
    var currOpcionIntenTer : Int!
    var currOpcionIntenCuart : Int!
    
    // Tablero de Verificacion
    @IBOutlet weak var viewTabPrimer: UIView!
    @IBOutlet weak var viewTabSeg: UIView!
    @IBOutlet weak var viewTabTer: UIView!
    @IBOutlet weak var viewTabCuart: UIView!
    
    
    func reiniciarVariables(){
        
        viewTabPrimer.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)
        viewTabSeg.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)
        viewTabTer.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)
        viewTabCuart.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)
        
        // Siempre se debe de empezar en modo juego, en el que no quiero saber la respuesta, y se debe de tener la 1 era opcion seleccionada
        intentos = 0
        lbIntentos.text = "Intento # " + String(intentos)
        currOpcionIntenPrimer = 0
        currOpcionIntenSeg = 0
        currOpcionIntenTer = 0
        currOpcionIntenCuart = 0
        
        bIntenPrimer.setBackgroundImage(esferas[0], for: .normal)
        bIntenSeg.setBackgroundImage(esferas[0], for: .normal)
        bIntenTer.setBackgroundImage(esferas[0], for: .normal)
        bIntenCuart.setBackgroundImage(esferas[0], for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Metiendo los elementos de la respuesta en su view correspondiente
        viewRespuesta.addSubview(imgResPrimer)
        viewRespuesta.addSubview(imgResSeg)
        viewRespuesta.addSubview(imgResTer)
        viewRespuesta.addSubview(imgResCuart)
        
        // Metiendo los elementos del tablero en la view correspondiente
        viewEstadoTablero.addSubview(viewTabPrimer)
        viewEstadoTablero.addSubview(viewTabSeg)
        viewEstadoTablero.addSubview(viewTabTer)
        viewEstadoTablero.addSubview(viewTabCuart)
        
        // Estilizando los views del tablero de verificacion
        viewTabPrimer.layer.borderWidth = 2
        viewTabPrimer.layer.borderColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5364672517)
        viewTabSeg.layer.borderWidth = 2
        viewTabSeg.layer.borderColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5364672517)
        viewTabTer.layer.borderWidth = 2
        viewTabTer.layer.borderColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5364672517)
        viewTabCuart.layer.borderWidth = 2
        viewTabCuart.layer.borderColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5364672517)
        
        // Guardando las opciones de esferas en un arreglo para simplificar codigo en las funciones posteriories
        esferas.append(UIImage(named: "black")!)
        esferas.append(UIImage(named: "blue")!)
        esferas.append(UIImage(named: "gold")!)
        esferas.append(UIImage(named: "purple")!)
        esferas.append(UIImage(named: "red")!)
        esferas.append(UIImage(named: "white")!)
                
        // Siempre se debe de empezar en modo juego, en el que no quiero saber la respuesta, y se debe de tener la 1 era opcion seleccionada

        scTipoJuego.selectedSegmentIndex = 0
        viewRespuesta.isHidden = true
        viewRespuesta.layer.cornerRadius = 5
        
        viewIntentoActual.layer.cornerRadius = 5

        // Para identificar cada boton y usar la misma funcion de actualizacion de imagenes adecuadamente
        bIntenPrimer.tag = 0
        bIntenSeg.tag = 1
        bIntenTer.tag = 2
        bIntenCuart.tag = 3
        
        // Estilizando los botones para que sean mas atractivos
        bIniciar.layer.borderWidth = 2
        // Se usa #colorLiteral con parametros r g b alpha(opacidad)
        bIniciar.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.77)
        bIniciar.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.56)
        bIniciar.layer.cornerRadius = 5
        
        bProbar.layer.borderWidth = 2
        bProbar.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7694124572)
        bProbar.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.56)
        bProbar.layer.cornerRadius = 5
        
        viewRespuesta.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.56)
        viewIntentoActual.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.56)
        
        // MARK: no se si esperarme a que le den iniciar para prepararlo o no
        reiniciarVariables()
        revolverRespuesta()
    }
    
    // Pasando por referencia el contador de la foto de la esfera que se esta usando y el boton (para actualizar su foto)
    func cambiarEsfera(curr : inout Int, boton : inout UIButton) -> Void{
        if curr == 5 {
            curr = 0
        }else{
            curr += 1
        }
        boton.setBackgroundImage(esferas[curr], for: .normal)
    }
    
    // Cambiar esfera en el boton correspondiente
    @IBAction func actualizarOpcion(_ sender: UIButton) {
                
        switch sender.tag {
        case 0:
            cambiarEsfera(curr: &currOpcionIntenPrimer, boton: &bIntenPrimer)
            break
        case 1:
            cambiarEsfera(curr: &currOpcionIntenSeg, boton: &bIntenSeg)
            break
        case 2:
            cambiarEsfera(curr: &currOpcionIntenTer, boton: &bIntenTer)
            break
        case 3:
            cambiarEsfera(curr: &currOpcionIntenCuart, boton: &bIntenCuart)
            break
        default:
            break
        }
                
    }
    
    // Para la secuencia del juego
    func revolverRespuesta() ->Void{
        var secuencia : Array<UIImage> = esferas
        // Revolver las opciones
        secuencia.shuffle()
        
        imgResPrimer.image = secuencia[0]
        imgResSeg.image = secuencia[1]
        imgResTer.image = secuencia[2]
        imgResCuart.image = secuencia[3]
        
    }
    
    // Reiniciar respuesta, las opciones e intentos
    @IBAction func iniciarJuego(_ sender: UIButton) {
        
        reiniciarVariables()
        revolverRespuesta()
    }
    
    func revisarRespuestaEIntento()->Bool{
        // Arreglos ha comparar para checar orden y existencia de las esferas en la respuesta y en el intento a checar del usuario
        var intentoUsuario : Array<UIImage> = []
        var respuesta : Array<UIImage> = []
        
        intentoUsuario.append(esferas[currOpcionIntenPrimer])
        intentoUsuario.append(esferas[currOpcionIntenSeg])
        intentoUsuario.append(esferas[currOpcionIntenTer])
        intentoUsuario.append(esferas[currOpcionIntenCuart])
        
        respuesta.append(imgResPrimer.image!)
        respuesta.append(imgResSeg.image!)
        respuesta.append(imgResTer.image!)
        respuesta.append(imgResCuart.image!)
        
        // Checar si existen los que puso y si estan en la posicion que los  selecciono
        var verificacion : Array<UIColor> = []
        var cantCorrectas : Int = 0
        var actVer : Int = 0
        for actRes in 0 ..< 4{
            for actInte in 0 ..< 4{
                if respuesta[actRes] == intentoUsuario[actInte]{
                    if actRes == actInte {
                        verificacion.append(UIColor(cgColor: #colorLiteral(red: 0.8108740482, green: 0.1326033115, blue: 0.1140374406, alpha: 1)))
                     //   verificacion[actVer].backgroundColor = #colorLiteral(red: 0.8108740482, green: 0.1326033115, blue: 0.1140374406, alpha: 1)
                        cantCorrectas += 1
                    }else{
                        verificacion.append(UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                      //  verificacion[actVer].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    }
                    actVer += 1
                }
            }
        }
        
        for _ in actVer ..< 4{
            verificacion.append(UIColor(cgColor: #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)))
         //   verificacion[actVer].backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.262745098, blue: 0.1294117647, alpha: 0.5559985017)
            actVer += 1
        }
        
        // Revolver la retroalimentacion y actualizar los colores del tablero de verificacion
        verificacion.shuffle()
        
        viewTabPrimer.backgroundColor = verificacion[0]
        viewTabSeg.backgroundColor = verificacion[1]
        viewTabTer.backgroundColor = verificacion[2]
        viewTabCuart.backgroundColor = verificacion[3]
                
        if cantCorrectas == 4 {
            return true
        }
        return false
    }
    
    func hayRepetidos() -> Bool{
        var intentoUsuario : Set<UIImage> = []
               
        intentoUsuario.insert(esferas[currOpcionIntenPrimer])
        intentoUsuario.insert(esferas[currOpcionIntenSeg])
        intentoUsuario.insert(esferas[currOpcionIntenTer])
        intentoUsuario.insert(esferas[currOpcionIntenCuart])
        
        if intentoUsuario.count < 4{
            return true
        }
        
        return false
        
    }
    
    // Revisar intento y desplegar icono blanco si se puso una que existe en la secuencia pero en el lugar equivocado, y rojo por aquellas que esten correctas tanto en color como posicion
    // Tambien debe checar si se pusieron repetidas
    @IBAction func checarIntento(_ sender: UIButton) {
        
        // Si hay repetidas, se debe de lanzar un mensaje y no modificar nada
        if hayRepetidos(){
            let alerta = UIAlertController(title: "Cuidado!", message: "No debes de haber colores repetidos en el mismo intento", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta,animated: true, completion: nil)
        }else{
            // Actualizar el turno actual y su verificacion
            intentos += 1
            lbIntentos.text = "Intento # " + String(intentos)
            if revisarRespuestaEIntento(){
                let alerta = UIAlertController(title: "¡FELICIDADES!", message: "Has ganado el juego en el intento #" + String(intentos), preferredStyle: .alert)
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alerta.addAction(accion)
                present(alerta,animated: true, completion: nil)
        
                reiniciarVariables()
                revolverRespuesta()
            }
        }
       
    }
    
    @IBAction func scCambiarSegmento(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            viewRespuesta.isHidden = true
            
        }else{
            viewRespuesta.isHidden = false
            
        }
        
    }
    


}


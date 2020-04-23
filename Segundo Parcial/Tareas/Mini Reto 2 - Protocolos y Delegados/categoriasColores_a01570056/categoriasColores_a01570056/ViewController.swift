//
//  ViewController.swift
//  categoriasColores_a01570056
//
//  Created by Trinity on 12/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

protocol administraCategorias {
    func agregaCategoria(cat : Categoria) -> Void
    func modificaCategoria(nuevoColor : UIColor) -> Void
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // MARK: - Configurando la Table View de Posibles Colores
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posiblesColoresVista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "idPosibles", for: indexPath)

               // Configure the cell...
               cell.backgroundColor =  posiblesColoresVista[indexPath.row]
               cell.backgroundColor?.withAlphaComponent(0.75)
               
               return cell
    }
    
    // MARK: - Funciones del delegado activadas cuando se selecciona algun color de la table view (si es que se siguen los pasos apropiadamente)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Agregar nueva categoria
        if tfnombreCat.isUserInteractionEnabled{
            if tfnombreCat.text != ""{
                let nuevaCat = Categoria(titulo: tfnombreCat.text!, color: posiblesColoresVista[indexPath.row])
                delegado.agregaCategoria(cat: nuevaCat)
                 navigationController?.popViewController(animated: true)
            }else{
                // Si no se puso el nombre de la categoria, no debemos permanecer en la misma vista, y de pasada deseleccionar el color que se habia escogido para que el usuario pueda cambiarlo cuando corriga su error
                tablewViewVista.deselectRow(at: indexPath, animated: true)
            }
        }else{
            // Modificar categoria
            delegado.modificaCategoria(nuevoColor: posiblesColoresVista[indexPath.row])
             navigationController?.popViewController(animated: true)
        }
        
       
    }

    @IBOutlet weak var basura: UILabel!
    
    @IBOutlet weak var tfnombreCat: UITextField!
    @IBOutlet weak var tablewViewVista: UITableView!
    
    var posiblesColoresVista = [UIColor]()
    var categoriaVista : Categoria!
    var delegado : administraCategorias!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Si no se mando el objeto categoria a editar, es porque se hara uno nuevo (se uso +), asi que se debe poder agregar un titulo de categoria y debe aparecer un placeholder
        if(categoriaVista == nil){
           tfnombreCat.placeholder = "categoria nombre"
            tfnombreCat.isUserInteractionEnabled = true
        }else{
            // Se mando objeto, osea que se va a modificar su color, no se debe de poder modificar su titulo y se debe de imprimir su nombre
            tfnombreCat.text = categoriaVista.titulo
            tfnombreCat.isUserInteractionEnabled = false
        }
       
        // Esta vista funciona como data source y delegate de su respectiva table view
        tablewViewVista.dataSource = self
        tablewViewVista.delegate = self
        
        tablewViewVista.reloadData()
    }
    
    

}


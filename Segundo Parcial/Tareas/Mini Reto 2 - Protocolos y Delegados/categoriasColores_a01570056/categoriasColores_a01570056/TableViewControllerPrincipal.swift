//
//  TableViewControllerPrincipal.swift
//  categoriasColores_a01570056
//
//  Created by Trinity on 12/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class TableViewControllerPrincipal: UITableViewController, administraCategorias {
    
    // MARK: - Metodos protocolo Administrar Categoria
    func agregaCategoria(cat: Categoria) {
        // Borrar de la lista de posibles colores aquel que se le haya asignado a la categoria
        listaCategorias.append(cat)
        let borrarColor = posiblesColores.firstIndex(of: cat.color)!
        posiblesColores.remove(at: borrarColor)
        tableView.reloadData()
    }
    
    func modificaCategoria(nuevoColor: UIColor) {
   // Primero agregar de nuevo a la lista de posibles colores el color anterior de la categoria, y luego quitar el nuevo
        posiblesColores.append(listaCategorias[categoriaEnviada].color)
        
        listaCategorias[categoriaEnviada].color = nuevoColor
        
        let borrarColor = posiblesColores.firstIndex(of: nuevoColor)!
        posiblesColores.remove(at: borrarColor)
        tableView.reloadData()
        
    }
    
    
    var listaCategorias = [Categoria]()
    var posiblesColores = [UIColor]()
    
    // renglon de categoria seleccionada que se querra ver en la siguiente vista
    var categoriaEnviada : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Categorías"
        
        posiblesColores = [UIColor.cyan, UIColor.blue, UIColor.red, UIColor.yellow, UIColor.orange,UIColor.purple, UIColor.green]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaCategorias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = listaCategorias[indexPath.row].titulo
        cell.backgroundColor =  listaCategorias[indexPath.row].color
        cell.backgroundColor?.withAlphaComponent(0.75)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vista = segue.destination as! ViewController
        
        vista.posiblesColoresVista = posiblesColores
        
        if segue.identifier == "ver"{
            let indexPath = tableView.indexPathForSelectedRow!
            categoriaEnviada = indexPath.row
            vista.categoriaVista = listaCategorias[categoriaEnviada]
            
        }
    
        vista.delegado = self
        
    }
    

}

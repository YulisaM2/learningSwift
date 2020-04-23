//
//  AvanzadoTableViewController.swift
//  masTableViews_a01570056
//
//  Created by Trinity on 16/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbDepartamento: UILabel!
    @IBOutlet weak var lbSueldo: UILabel!
}

class AvanzadoTableViewController: UITableViewController {
    
    var listaEmpleados = [Empleado]()
    var alturaCelda : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alturaCelda = 136
        title = "Empleados"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        var buffer = Empleado(nombre: "Juan", sueldo: 100, departamento: "Finanzas", foto: UIImage(named: "beto")!)
        listaEmpleados.append(buffer)
        buffer = Empleado(nombre: "Alex", sueldo: 53, departamento: "Technology", foto: UIImage(named: "enrique")!)
        listaEmpleados.append(buffer)
        buffer = Empleado(nombre: "Lorena", sueldo: 2903, departamento: "Leadership", foto: UIImage(named: "elmo")!)
        listaEmpleados.append(buffer)
        buffer = Empleado(nombre: "Yulisa", sueldo: 702, departamento: "Corporative", foto: UIImage(named: "lucas")!)
        listaEmpleados.append(buffer)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaEmpleados.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.imgFoto.image = listaEmpleados[indexPath.row].foto
        cell.lbNombre.text = listaEmpleados[indexPath.row].nombre
        cell.lbDepartamento.text = listaEmpleados[indexPath.row].departamento
        cell.lbSueldo.text = String(listaEmpleados[indexPath.row].sueldo)
        
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.blue
        }
        cell.backgroundColor?.withAlphaComponent(0.50)
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listaEmpleados.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let temp = listaEmpleados[fromIndexPath.row]
        listaEmpleados[fromIndexPath.row] = listaEmpleados[to.row]
        listaEmpleados[to.row] = temp
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return alturaCelda
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

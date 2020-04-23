//
//  TableViewController.swift
//  tableViewController_a01570056
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listaJugadores = [Jugador]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        var jugador = Jugador(nombre: "Juan", puntos: 2000, email: "juan@gmail.com")
        listaJugadores.append(jugador)
        jugador = Jugador(nombre: "Carolina", puntos: 23000, email: "caro@gmail.com")
        listaJugadores.append(jugador)
        jugador = Jugador(nombre: "Karla", puntos: 3100, email: "karla@gmail.com")
        listaJugadores += [jugador]
        
        title = "Jugadores"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaJugadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = UIImage(named: "usuario")

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vista = segue.destination as! ViewController
        
        vista.jugador = listaJugadores[tableView.indexPathForSelectedRow!.row]
        
        // Esto lo hizo diferente la profesora, revisar su respuesta
        let index = tableView.indexPathForSelectedRow!
        let currCell = tableView.cellForRow(at: index)
        vista.imgPersonaVC = currCell?.imageView?.image
        
    }
    

}

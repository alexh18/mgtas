//
//  TableViewController.swift
//  ProyectoAvance
//
//  Created by UNAM FCA 11 on 06/04/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var info : [secciones] = [ secciones(info: "Tareas", imagen: UIImage(named: "tareas")!), secciones(info: "Ejercicio", imagen: UIImage(named: "ejercicio")!),secciones(info: "Estado de Animo", imagen: UIImage(named: "mood")!), secciones(info: "Agua", imagen: UIImage(named: "agua")!)   ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return info.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCell
        
        let secciones = info[indexPath.row]
        
        cell.info.text = secciones.info
        cell.imagen.image = secciones.imagen
        
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secciones2 = self.info[indexPath.row]
        
        switch secciones2.info{
            
        case "Tareas":
            performSegue(withIdentifier: "segue1", sender: nil)
            break
        case "Ejercicio":
            performSegue(withIdentifier: "segue2", sender: nil)
            break
        case "Estado de Animo":
            performSegue(withIdentifier: "segue3", sender: nil)
            break
        case "Agua":
            performSegue(withIdentifier: "segue4", sender: nil)
            break
        default:
            break
            
        }
    }
}

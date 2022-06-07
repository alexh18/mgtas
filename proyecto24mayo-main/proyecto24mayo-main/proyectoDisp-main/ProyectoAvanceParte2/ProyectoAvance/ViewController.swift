//
//  ViewController.swift
//  ProyectoAvance
//
//  Created by UNAM FCA 11 on 06/04/22.
//

import UIKit

class ViewController: UIViewController {
    
   
    var info : [secciones] = [ secciones(info: "tarea", imagen: UIImage(named: "journal")!)]
    
    var imagen : [secciones] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
 


}

    
    extension ViewController: UITableViewDelegate, UITableViewDataSource{
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return info.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCell
            
            let secciones = info[indexPath.row]
            
            cell.info.text = secciones.info
            cell.imagen.image = secciones.imagen
            
            
            
            return cell
            
        }
        
   
        
        
        
    }


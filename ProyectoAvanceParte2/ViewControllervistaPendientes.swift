//
//  ViewControllervistaPendientes.swift
//  ProyectoAvance
//
//  Created by Daniel Belmont on 02/06/22.
//

import UIKit

class ViewControllervistaPendientes: UIViewController {

    @IBOutlet weak var lbTres: UILabel!
    @IBOutlet weak var lbDos: UILabel!
    @IBOutlet weak var lbUno: UILabel!
    @IBOutlet weak var lbCuatro: UILabel!
    
    var Tareas : Secciones!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lbTres.text = Tareas.titulo
        lbUno.text = Tareas.fecha
        lbDos.text = Tareas.materia
        lbCuatro.text = Tareas.texto
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
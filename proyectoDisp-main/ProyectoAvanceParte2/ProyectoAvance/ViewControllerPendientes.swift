//
//  ViewControllerPendientes.swift
//  ProyectoAvance
//
//  Created by Daniel Belmont on 27/04/22.
//

import UIKit

class ViewControllerPendientes: UIViewController {
    var info : Secciones?
    
    
    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    @IBOutlet weak var txtMateria: UITextField!
    @IBOutlet weak var txtTexto: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if info != nil{
            txtTitulo.text = Secciones?.titulo
            txtFecha.text = Secciones?.fecha
            txtMateria.text = Secciones?.materia
            txtTexto.text = Secciones?.texto
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func guardar(_ sender: UIButton) {
    }
    
    if let titulo = txtTitulo.text, let fecha = txtFecha.text, let materia = txtMateria.text, let texto = txtTexto.text {
        if corte == nil {
            
        }
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

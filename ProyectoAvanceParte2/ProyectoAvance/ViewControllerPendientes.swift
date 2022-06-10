//
//  ViewControllerPendientes.swift
//  ProyectoAvance
//
//  Created by UNAM FCA 11 on 27/04/22.
//

import UIKit
import CoreData

class ViewControllerPendientes: UIViewController {
    var info : Secciones?
    var Tareas : [Secciones] = [Secciones] ()
//    var pendienteSeleccionado : Secciones = Secciones()
    var tarea : Secciones = Secciones()
    var bandera = "agregar"
   
    
    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    @IBOutlet weak var txtMateria: UITextField!
    @IBOutlet weak var txtTexto: UITextField!
    
    @IBOutlet weak var tablaPendientes: UITableView!
    
    @IBOutlet weak var actualizar: UIButton!

    @IBOutlet weak var segmento: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaPendientes.delegate = self
        tablaPendientes.dataSource = self
        
        
        
        if segmento.selectedSegmentIndex == 0{
            tablaPendientes.isHidden = true
            
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recoverTareas()
        tablaPendientes.reloadData()
    }
    
    
    
    @IBAction func mostrarPendientes(_ sender: Any) {
       
        
        if segmento.selectedSegmentIndex == 0{
            tablaPendientes.isHidden = true
            actualizar.setTitle("Agregar", for: .normal)
            
        }else{
            tablaPendientes.isHidden = false
            recoverTareas()
            tablaPendientes.reloadData()
            
        }
    }
    
    func getContext() -> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func recoverTareas()  {
        

        let context = getContext()
        let fetchRequest : NSFetchRequest<Secciones> = Secciones.fetchRequest()
        
        do {
            Tareas = try context.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("No se pudo recuperar \(error), \(error.userInfo)")
        }
      
    }
    func limpiar (){
        txtTexto.text = ""
        txtFecha.text = ""
        txtTitulo.text = ""
        txtMateria.text = ""
    }
    
    func saveEntitySecciones(titulo : String, fecha : String, materia : String, texto : String){
        let context = getContext()
        
        let entitySecciones = NSEntityDescription.entity(forEntityName: "Secciones", in: context)!
        
        let seccionesManaged = NSManagedObject(entity: entitySecciones, insertInto: context) as! Secciones
        
        seccionesManaged.titulo = titulo
        seccionesManaged.fecha = fecha
        seccionesManaged.materia = materia
        seccionesManaged.texto = texto
        
        do{
            try context.save()
            
        } catch let error as NSError {
            print("no se pudo salvar: \(error), \(error.userInfo)")
        }
        
        
    }
    @IBAction func guardar(_ sender: UIButton) {
        
        if let titulo = txtTitulo.text, let fecha = txtFecha.text, let materia = txtMateria.text, let texto = txtTexto.text{
            
            if bandera == "agregar"{
                saveEntitySecciones(titulo: titulo, fecha: fecha, materia: materia, texto: texto)
                print("se guardo correctamente la informacion")

            } else if bandera == "actualizar"{
                updateEntitySecciones(seccion: tarea, titulo: titulo, fecha: fecha, materia: materia, texto: texto)
                print("se actualizo correctamente la informacion")
            }
            
                   
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
extension ViewControllerPendientes : UITableViewDelegate, UITableViewDataSource{
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Tareas.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "celda2", for: indexPath) as! TableViewCellPendientes
     
    let tarea = Tareas[indexPath.row]
     
    cell.titulo.text = tarea.titulo
    cell.fecha.text = tarea.fecha
    cell.materia.text = tarea.materia
    cell.descripcion.text = tarea.texto
    
    
    
    return cell
}
    
    
   
    

    

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil)
        {(_, _, completionHandler) in
        
            let tarea = self.Tareas[indexPath.row]
            self.deleteEntitySecciones(tarea: tarea)
            self.recoverTareas()
            self.tablaPendientes.reloadData()
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func deleteEntitySecciones (tarea: Secciones){
        let context = getContext()
        context.delete(tarea)
        
        do {
            try context.save()
        }
        catch let error as NSError{
            print("No se pudo recuperar \(error), \(error.userInfo)")
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .destructive, title: nil)
        {(_, _, completionHandler) in
            self.limpiar()
            self.tarea = self.Tareas[indexPath.row]
            self.txtTitulo.text = self.tarea.titulo
            self.txtFecha.text = self.tarea.fecha
            self.txtMateria.text = self.tarea.materia
            self.txtTexto.text = self.tarea.texto
            
            self.bandera = "actualizar"
            
            
            self.actualizar.setTitle("actualizar", for: .normal)
            completionHandler(true)
        }
        updateAction.image = UIImage(systemName: "pencil")
        updateAction.backgroundColor = .systemGreen
        let configuration = UISwipeActionsConfiguration(actions: [updateAction])
        return configuration
    }
    
    func updateEntitySecciones(seccion: Secciones, titulo : String, fecha : String, materia : String, texto : String){
        let context = getContext()
      let seccionManaged = seccion as NSManagedObject
        seccionManaged.setValue(titulo, forKey: "titulo")
        seccionManaged.setValue(fecha, forKey: "fecha")
        seccionManaged.setValue(materia, forKey: "materia")
        seccionManaged.setValue(texto, forKey: "texto")
        do {
            try context.save()
        }
        catch let error as NSError{
            print("No se pudo recuperar \(error), \(error.userInfo)")
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        info = Tareas[indexPath.row]
        performSegue(withIdentifier: "segue8", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue8" {
            let vistaDetalle = segue.destination as! ViewControllervistaPendientes
            
            if info != nil {
                vistaDetalle.Tareas = info!
            }
        }
    }

}


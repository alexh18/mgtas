//
//  ViewControllerEjercicio.swift
//  ProyectoAvance
//
//  Created by Laboratorio UNAM-Apple on 18/05/22.
//

import UIKit
import CoreData

enum ejercicioEnf : String {
    
    case cero = "Biceps"
    case uno = "Triceps"
    case dos = "Hombro"
    case tres = "Espalda"
    case cuatro = "Gluteo"
    
}

class ViewControllerEjercicio: UIViewController {
    var dato : Ejercicios?
    var Fisicos : [Ejercicios] = [Ejercicios] ()
    var fisico : Ejercicios = Ejercicios ()
    var bandera = "Agregar"
   
    
    @IBOutlet weak var sementoEnfoque: UISegmentedControl!
    @IBOutlet weak var txtDia: UITextField!
    @IBOutlet weak var txtEnfoque: UITextField!
    @IBOutlet weak var txtSerie: UITextField!

    
    //conectar boton como oulet
    @IBOutlet weak var agregar: UIButton!
    //conectar tabla, no celda (tablaEjercicios)
    @IBOutlet weak var tablaEjercicios: UITableView!
    
    
    @IBOutlet weak var segmentoEjercicio: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaEjercicios.delegate = self
        tablaEjercicios.dataSource = self
        
        
        
     
   
    

    }
    override func viewDidAppear(_ animated: Bool) {
        recoverFisicos()
        tablaEjercicios.reloadData()
  
    }
    
    
    
    @IBAction func seg0(_ sender: Any) {
        
        if sementoEnfoque.selectedSegmentIndex == 0{
            tablaEjercicios
        }
    }
    @IBAction func mostrarEjercicios(_ sender: Any) {
        
        if segmentoEjercicio.selectedSegmentIndex == 0{
            tablaEjercicios.isHidden = true
            agregar.setTitle("Agregar", for: .normal)
            
        }else{
            tablaEjercicios.isHidden = false
            recoverFisicos()
            tablaEjercicios.reloadData()
            
        }
    }
    
    
    func getContext() -> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func recoverFisicos()  {
        

        let context = getContext()
        let fetchRequest : NSFetchRequest<Ejercicios> = Ejercicios.fetchRequest()
        
        do {
            Fisicos = try context.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("No se pudo recuperar \(error), \(error.userInfo)")
        }
      
    }
    
    func limpiar (){
        txtDia.text = ""
        txtEnfoque.text = ""
        txtSerie.text = ""
        
    }
    func saveEntityEjercicios(dia : String, enfoque : String, serie : String){
        let context = getContext()
        
        let entityEjercicios = NSEntityDescription.entity(forEntityName: "Ejercicios", in: context)!
        
        let ejerciciosManaged = NSManagedObject(entity: entityEjercicios, insertInto: context) as! Ejercicios
        
        ejerciciosManaged.dia = dia
        ejerciciosManaged.enfoque = enfoque
        ejerciciosManaged.serie = serie
        
        
        do{
            try context.save()
            
        } catch let error as NSError {
            print("no se pudo salvar: \(error), \(error.userInfo)")
        }
        
        
    }
    //Arreglar despues de conectar el boton y segmento
    
    
        
    
    
    
    @IBAction func guardar(_ sender: Any) {
    
    
        if let dia = txtDia.text, let serie = txtSerie.text{
                
                if bandera == "Agregar"{
                    
                    
                    
                    switch sementoEnfoque.selectedSegmentIndex{
                    case 0:
                        saveEntityEjercicios(dia: dia , enfoque:ejercicioEnf.cero.rawValue, serie: serie)
                    case 1:
                        saveEntityEjercicios(dia: dia , enfoque:ejercicioEnf.uno.rawValue, serie: serie)
                    case 2:
                        saveEntityEjercicios(dia: dia , enfoque:ejercicioEnf.dos.rawValue, serie: serie)
                    case 3:
                        saveEntityEjercicios(dia: dia , enfoque:ejercicioEnf.tres.rawValue, serie: serie)
                    case 4:      saveEntityEjercicios(dia: dia , enfoque: ejercicioEnf.cuatro.rawValue, serie: serie)
                    default:
                        break
                    }
                    
                    
                    print("se guardo la info")
                }else if bandera == "Agregar"{
                    
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

extension ViewControllerEjercicio : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda3", for: indexPath)as! TableViewCellEjercicio
        
        let fisico = Fisicos[indexPath.row]
        
        cell.lableDia.text = fisico.dia
        cell.lableSerie.text = fisico.serie
        cell.lableEnfoque.text = fisico.enfoque
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Fisicos.count
            
        }
    

func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .destructive, title: nil)
    {(_, _, completionHandler) in
    
        let fisico = self.Fisicos[indexPath.row]
        self.deleteEntityEjercicios(fisico: fisico)
        self.recoverFisicos()
        self.tablaEjercicios.reloadData()
        completionHandler(true)
    }
    deleteAction.image = UIImage(systemName: "trash")
    deleteAction.backgroundColor = .systemRed
    let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
    return configuration
}

func deleteEntityEjercicios (fisico: Ejercicios){
    let context = getContext()
    context.delete(fisico)
    
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
        self.fisico = self.Fisicos[indexPath.row]
        self.txtDia.text = self.fisico.dia
        self.txtEnfoque.text = self.fisico.enfoque
        self.txtSerie.text = self.fisico.serie
               
        self.bandera = "agregar"
        
        
        self.agregar.setTitle("agregar", for: .normal)
        completionHandler(true)
    }
    updateAction.image = UIImage(systemName: "pencil")
    updateAction.backgroundColor = .systemGreen
    let configuration = UISwipeActionsConfiguration(actions: [updateAction])
    return configuration
}

    func updateEntityEjercicios(ejercicio: Ejercicios, dia : String, enfoque : String, serie : String){
        let context = getContext()
  let ejercicioManaged = ejercicio as NSManagedObject
    ejercicioManaged.setValue(dia, forKey: "dia")
    ejercicioManaged.setValue(enfoque, forKey: "enfoque")
    ejercicioManaged.setValue(serie, forKey: "serie")
    do {
        try context.save()
    }
    catch let error as NSError{
        print("No se pudo recuperar \(error), \(error.userInfo)")
    }
}
}

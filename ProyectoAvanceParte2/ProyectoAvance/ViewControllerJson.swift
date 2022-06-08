//
//  ViewControllerJson.swift
//  ProyectoAvance
//
//  Created by Daniel Belmont on 04/06/22.
//

import UIKit
import SwiftUI

//con estas estructuras se accedera a los valores

struct Peticion : Codable{
     var title: String
     var description: String
    
 }
 struct Peticiones: Codable{
     var articles : [Peticion]
 }
class ViewControllerJson: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
 var peticiones = [Peticion]()
    
    
    @IBOutlet weak var tablaJson: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
let urlString  = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=955da1cc1b1d4b509142784df9c54c4d"
        if let url = URL(string: urlString){
            
        if let datos = try? Data(contentsOf: url){
                parsear(json: datos)
            }
        }

    }
    func parsear (json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPeticiones = try? decoder.decode(Peticiones.self, from: json){
            peticiones = jsonPeticiones.articles
            tablaJson.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peticiones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaJson.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        celda.textLabel?.text = peticiones[indexPath.row].title
        celda.detailTextLabel?.text = peticiones[indexPath.row].description
        return celda
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

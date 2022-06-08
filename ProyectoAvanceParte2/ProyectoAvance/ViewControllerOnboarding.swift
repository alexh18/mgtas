//
//  ViewControllerOnboarding.swift
//  ProyectoAvance
//
//  Created by Laboratorio UNAM-Apple on 26/05/22.
//

import UIKit

class ViewControllerOnboarding: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func botonComenzar(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "sesion")
        let controller = storyboard?.instantiateViewController(identifier: "MainTabBar") as! UIViewController
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
        
    }
    


}




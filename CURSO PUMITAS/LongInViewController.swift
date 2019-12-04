//
//  LongInViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 11/25/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LongInViewController: UIViewController {
    
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Contraseña: UITextField!
    @IBOutlet weak var LongIn: UIButton!
    @IBOutlet weak var Error: UILabel!
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor:secondaryColor)

        setupElements()
    }
    func setupElements(){
        Error.alpha = 0
        Utilidades.styleTextField(Correo)
        Utilidades.styleTextField(Contraseña)
        Utilidades.styleHollowButton(LongIn)
       
    }

    
    @IBAction func LongInTap(_ sender: Any) {
        let email = Correo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = Contraseña.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.Error.text = error!.localizedDescription
                self.Error.alpha = 1
            }
            else {
                
                 let INICIOViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.inicioViewController) as? InicioViewController
                 
                 self.view.window?.rootViewController = INICIOViewController
                 self.view.window?.makeKeyAndVisible()
                
            }
        }
    }
    
    
}




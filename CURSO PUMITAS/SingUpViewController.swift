//
//  SingUpViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 11/25/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Apellido: UITextField!
    @IBOutlet weak var Materno: UITextField!
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Contraseña: UITextField!
    
    @IBOutlet weak var Error: UILabel!
    @IBOutlet weak var SingUp: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupElements()
    }
    func setupElements(){
        Error.alpha = 0
        Utilidades.styleTextField(Nombre)
        Utilidades.styleTextField(Apellido)
        Utilidades.styleTextField(Materno)
        Utilidades.styleTextField(Correo)
        Utilidades.styleTextField(Contraseña)
        Utilidades.styleFilledButton(SingUp)
        
    }
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if Nombre.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Apellido.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Materno.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Correo.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Contraseña.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "."
        }
        
        // Check if the password is secure
        let cleanedPassword = Contraseña.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilidades.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "La COMTRASEÑA debe contener 8 caracteres."
        }
        
        return nil
    }
    
    
    @IBAction func SingUpTap(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let nombre = Nombre.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let AP = Apellido.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let AM = Materno.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = Correo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Contraseña.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error al crear usuario")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("usuarios").addDocument(data: ["Nombre":nombre, "Apellido":AP,"Materno":AM, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("No se guardaron sus datos")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
    func showError(_ message:String) {
        
        Error.text = message
        Error.alpha = 1
    }
    
    func transitionToHome() {
        
        let INICIOViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.inicioViewController) as? InicioViewController
        
        view.window?.rootViewController = INICIOViewController
        view.window?.makeKeyAndVisible()
        
         //performSegue(withIdentifier: "Prueba", sender: nil)
    }
        

}

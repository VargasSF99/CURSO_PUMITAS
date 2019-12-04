//
//  TodoViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 12/1/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit

extension TutorViewController {
    
    func setupfoto(){
        foto.layer.borderWidth = 1
        //foto.bac
        foto.layer.masksToBounds = false
        foto.layer.borderColor = UIColor.black.cgColor
        foto.layer.cornerRadius = foto.frame.height/2
        foto.clipsToBounds = true
        foto.isUserInteractionEnabled = true
        let click = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        foto.addGestureRecognizer(click)
        
    }
    
    @objc func presentPicker(){
        let picker = UIImagePickerController ()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
        
    }
}

extension TutorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let fotoseleccionada = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            imagen = fotoseleccionada
            foto.image = fotoseleccionada
        }
        
        if let original = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            foto.image = original
            imagen = original
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

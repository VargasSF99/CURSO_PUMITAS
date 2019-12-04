//
//  InicioViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 11/25/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {
    
    @IBOutlet weak var Tutor: UIButton!
    @IBOutlet weak var Mapa: UIButton!
    @IBOutlet weak var Numeros: UIButton!
    @IBOutlet weak var MONITOR: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet var BloqueA: [UIButton]!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupElements()
        
    }
    func setupElements(){
        
        Utilidades.styleNumButton(Tutor)
        Utilidades.styleHollowButton(Mapa)
        Utilidades.styleNumButton(Numeros)
        Utilidades.styleHollowButton(MONITOR)
        Utilidades.styleFilledButton(A)
        Utilidades.styleFilledButton(B)
        Utilidades.styleFilledButton(C)

    }
    
    
    @IBAction func MENU(_ sender: UIButton) {
        BloqueA.forEach{(button) in UIView.animate(withDuration:0.3, animations: {
            button.isHidden = !button.isHidden
            self.view.layoutIfNeeded()
        })
            
        }
    }
        
}
    



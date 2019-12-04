//
//  ColorViewController.swift
//  CURSO PUMITAS
//
//  Created by 2020-1 on 11/26/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit
import AVFoundation



class ColorViewController: UIViewController {
    
    @IBOutlet weak var Atras: UIButton!
    
    var button1 = AVAudioPlayer()
    var button2 = AVAudioPlayer()
    var button3 = AVAudioPlayer()
    var button4 = AVAudioPlayer()
    var button5 = AVAudioPlayer()
    var botton6 = AVAudioPlayer()
    var button7 = AVAudioPlayer()
    var button8 = AVAudioPlayer()
    var button9 = AVAudioPlayer()
    var button10 = AVAudioPlayer()
    var button11 = AVAudioPlayer()
    var button12 = AVAudioPlayer()
    var button13 = AVAudioPlayer()
    var button14 = AVAudioPlayer()
    var button15 = AVAudioPlayer()
    var button16 = AVAudioPlayer()
    var button17 = AVAudioPlayer()
    var button18 = AVAudioPlayer()
    var button19 = AVAudioPlayer()
    var button20 = AVAudioPlayer()
    var button21 = AVAudioPlayer()
    var button22 = AVAudioPlayer()
    var button23 = AVAudioPlayer()
    var button24 = AVAudioPlayer()
    
    
    
    //BOTONES LINDOS
    
    
    @IBOutlet weak var B1: UIButton!
    
    @IBOutlet weak var B2: UIButton!
    
    @IBOutlet weak var B3: UIButton!
    
    @IBOutlet weak var B4: UIButton!
    
    @IBOutlet weak var B5: UIButton!
    
    
    @IBOutlet weak var B6: UIButton!
    
    @IBOutlet weak var B7: UIButton!
    
    
    @IBOutlet weak var B8: UIButton!
    
    
    @IBOutlet weak var B9: UIButton!
    
    
    @IBOutlet weak var B10: UIButton!
    
    
    @IBOutlet weak var B11: UIButton!
    
    
    @IBOutlet weak var B12: UIButton!
    
    @IBOutlet weak var B13: UIButton!
    
    
    @IBOutlet weak var B14: UIButton!
    
    
    @IBOutlet weak var B15: UIButton!
    
    
    @IBOutlet weak var B16: UIButton!
    
    
    @IBOutlet weak var B17: UIButton!
    
    
    @IBOutlet weak var B18: UIButton!
    
    
    @IBOutlet weak var B19: UIButton!
    
    
    @IBOutlet weak var B20: UIButton!
    
    
    @IBOutlet weak var B21: UIButton!
    
    
    @IBOutlet weak var B22: UIButton!
    
    
    @IBOutlet weak var B23: UIButton!
    
    
    @IBOutlet weak var B24: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //color
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        
        //boton bonito
        botonBonito()

        
        
        //para marcarlo como try y no me truene la app si falla
        do{
            
            //vamos a cargar nuestro audio
            button1 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio1", ofType: "ogg")!))
            //vamos a prepararlo para reproducirlo
            button1.prepareToPlay()
            
            button2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio2", ofType: "ogg")!))
            button2.prepareToPlay()
            
            button3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio3", ofType: "ogg")!))
            button3.prepareToPlay()
            
            button4 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio4", ofType: "ogg")!))
            button4.prepareToPlay()
            
            button5 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio5", ofType: "ogg")!))
            button5.prepareToPlay()
            
            botton6 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio6", ofType: "ogg")!))
            botton6.prepareToPlay()
            
            button7 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio7", ofType: "ogg")!))
            button7.prepareToPlay()
            
            button8 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio8", ofType: "ogg")!))
            button8.prepareToPlay()
            
            button9 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio9", ofType: "ogg")!))
            button9.prepareToPlay()
            
            button10 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio10", ofType: "ogg")!))
            button10.prepareToPlay()
            
            button11 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio11", ofType: "ogg")!))
            button11.prepareToPlay()
            
            button12 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio12", ofType: "ogg")!))
            button12.prepareToPlay()
            
            button13 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio13", ofType: "ogg")!))
            button13.prepareToPlay()
            
            button14 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio14", ofType: "ogg")!))
            button14.prepareToPlay()
            
            button15 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio15", ofType: "ogg")!))
            button15.prepareToPlay()
            
            button16 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio16", ofType: "ogg")!))
            button16.prepareToPlay()
            
            button17 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio17", ofType: "ogg")!))
            button17.prepareToPlay()
            
            button18 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio18", ofType: "ogg")!))
            button18.prepareToPlay()
            
            button19 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio19", ofType: "ogg")!))
            button19.prepareToPlay()
            
            button20 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio20", ofType: "ogg")!))
            button20.prepareToPlay()
            
            button21 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio211", ofType: "ogg")!))
            button21.prepareToPlay()
            
            button22 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio22", ofType: "ogg")!))
            button22.prepareToPlay()
            
            button23 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio23", ofType: "ogg")!))
            button23.prepareToPlay()
            
            button24 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio24", ofType: "ogg")!))
            button24.prepareToPlay()
            
        } catch{
            print(error)
        }
        
    }//final de override
    
    
    func botonBonito(){
        
        Utilidades.styleNumButton(B1)
        Utilidades.styleNumButton(B2)
        Utilidades.styleNumButton(B3)
        Utilidades.styleNumButton(B4)
        Utilidades.styleNumButton(B5)
        Utilidades.styleNumButton(B6)
        Utilidades.styleNumButton(B7)
        Utilidades.styleNumButton(B8)
        Utilidades.styleNumButton(B9)
        Utilidades.styleNumButton(B10)
        Utilidades.styleNumButton(B11)
        Utilidades.styleNumButton(B12)
        Utilidades.styleNumButton(B13)
        Utilidades.styleNumButton(B14)
        Utilidades.styleNumButton(B15)
        Utilidades.styleNumButton(B16)
        Utilidades.styleNumButton(B17)
        Utilidades.styleNumButton(B18)
        Utilidades.styleNumButton(B19)
        Utilidades.styleNumButton(B20)
        Utilidades.styleNumButton(B22)
        Utilidades.styleNumButton(B21)
        Utilidades.styleNumButton(B23)
        Utilidades.styleNumButton(B24)
        Utilidades.styleHollowButton(Atras)
        
    
    }
    
    @IBAction func soundB1(_ sender: Any) {
        
        //sino se esta reproduciendolo reproducelo
        if button1.isPlaying == false{
            button1.play()
        }
        
        
    }
    
    @IBAction func soundB2(_ sender: Any) {
        if button2.isPlaying == false{
            button2.play()
            
            
        }
        
        
    }
    
    
    @IBAction func soundB3(_ sender: Any) {
        if button3.isPlaying == false{
            button3.play()
        }
        
    }
    
    @IBAction func soundB4(_ sender: Any) {
        if button4.isPlaying == false{
            button4.play()
        }
        
    }
    
    
    @IBAction func soundB5(_ sender: Any) {
        if button5.isPlaying == false{
            button5.play()
        }
        
    }
    
    @IBAction func soundB6(_ sender: Any) {
        if botton6.isPlaying == false{
            botton6.play()
        }
        
    }
    
    @IBAction func soundB7(_ sender: Any) {
        if button7.isPlaying == false{
            button7.play()
        }
    }
    
    
    @IBAction func soundB8(_ sender: Any) {
        if button8.isPlaying == false{
            button8.play()
        }
    }
    
    
    @IBAction func soundB9(_ sender: Any) {
        if button9.isPlaying == false{
            button9.play()
        }
    }
    
    @IBAction func soundB10(_ sender: Any) {
        if button10.isPlaying == false{
            button10.play()
        }
    }
    
    @IBAction func soundB11(_ sender: Any) {
        if button11.isPlaying == false{
            button11.play()
        }
    }
    
    @IBAction func soundB12(_ sender: Any) {
        if button12.isPlaying == false{
            button12.play()
        }
    }
    
    @IBAction func soundB13(_ sender: Any) {
        if button13.isPlaying == false{
            button13.play()
        }
    }
    
    @IBAction func soundB14(_ sender: Any) {
        if button14.isPlaying == false{
            button14.play()
        }
    }
    
    @IBAction func soundB15(_ sender: Any) {
        if button15.isPlaying == false{
            button15.play()
        }
    }
    
    @IBAction func soundB16(_ sender: Any) {
        if button16.isPlaying == false{
            button16.play()
        }
    }
    
    @IBAction func soundB17(_ sender: Any) {
        if button17.isPlaying == false{
            button17.play()
        }
    }
    
    @IBAction func soundB18(_ sender: Any) {
        if button18.isPlaying == false{
            button18.play()
        }
    }
    
    @IBAction func soundB19(_ sender: Any) {
        if button19.isPlaying == false{
            button19.play()
        }
    }
    
    @IBAction func soundB20(_ sender: Any) {
        if button20.isPlaying == false{
            button20.play()
        }
    }
    
    @IBAction func soundB21(_ sender: Any) {
        if button21.isPlaying == false{
            button21.play()
        }
    }
    
    @IBAction func soundB22(_ sender: Any) {
        if button22.isPlaying == false{
            button22.play()
        }
    }
    
    @IBAction func soundB23(_ sender: Any) {
        if button23.isPlaying == false{
            button23.play()
        }
    }
    
    @IBAction func soundB24(_ sender: Any) {
        if button24.isPlaying == false{
            button24.play()
        }
    }
    
    
    @IBAction func ATRASmenu(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    

}

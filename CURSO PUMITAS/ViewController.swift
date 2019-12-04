//
//  ViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 11/25/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    @IBOutlet weak var SingUp: UIButton!
    @IBOutlet weak var LongIn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupElements()
        setUpVideo()
        //view.addVe
    }
    
    func setupElements(){
        Utilidades.styleFilledButton(SingUp)
        Utilidades.styleNumButton(LongIn)
    }
    func setUpVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "video2", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*0.4, y: 0, width:
            self.view.frame.size.width*1.8, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate:1)
        
        
    }
    
    


}


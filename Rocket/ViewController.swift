//
//  ViewController.swift
//  1stApp
//
//  Created by mac on 09.10.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var launchModeView: UIView!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var rocketImageView: UIImageView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "rocket_launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }
    
    
    @IBAction func lounchPressed(_ sender: Any) {
        launchModeView.isHidden = false
        player?.play()
        UIView.animate(withDuration: 3.0, animations: {
            var rocketFrame = self.rocketImageView.frame
            rocketFrame.origin.y = 70
            self.rocketImageView.frame = rocketFrame
        }) { _ in
            self.launchLabel.isHidden = false
            self.onLabel.isHidden = false
        }
        
    }
    
}

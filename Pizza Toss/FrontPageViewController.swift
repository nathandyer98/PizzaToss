//
//  FrontPageViewController.swift
//  Pizza Toss
//
//  Created by nd17aak on 12/01/2020.
//  Copyright © 2020 nd17aak. All rights reserved.
//

import UIKit
import AVFoundation

class FrontPageViewController: UIViewController {

    var introMusic: AVAudioPlayer!
    @IBOutlet weak var catRun: UIImageView!
    @IBOutlet weak var ratRun: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func playMusic() {
            guard let url = Bundle.main.url(forResource: "introMusic", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                introMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let introMusic = introMusic else { return }
                introMusic.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
        playMusic()
        
        
        
        //Animation of running cat
        var catArray: [UIImage]!
        
        catArray = [UIImage(named: "cat1.png")!,
                      UIImage(named: "cat2.png")!,
                      UIImage(named: "cat3.png")!,
                      UIImage(named: "cat4.png")!,
                      UIImage(named: "cat5.png")!,
                      UIImage(named: "cat6.png")!,
                      UIImage(named: "cat7.png")!,]
        
        var ratArray: [UIImage]
        
        ratArray = [UIImage(named: "rat1.png")!,
                      UIImage(named: "rat2.png")!,
                      UIImage(named: "rat3.png")!,
                      UIImage(named: "rat4.png")!,
                      UIImage(named: "rat5.png")!,]
        
        ratRun.image = UIImage.animatedImage(with: ratArray, duration: 0.3)
        catRun.image = UIImage.animatedImage(with: catArray, duration: 0.5)
        
        //Animation of cat running
        UIView.animate(withDuration: 3.7, delay: 0.0, options: [UIView.AnimationOptions.preferredFramesPerSecond60, .repeat, .curveLinear], animations:
            {self.catRun.center.x += self.view.bounds.width*2}, completion: nil)
        
        UIView.animate(withDuration: 3.7, delay: 0.0, options: [UIView.AnimationOptions.preferredFramesPerSecond60, .repeat, .curveLinear], animations:
            {self.ratRun.center.x += self.view.bounds.width*2}, completion: nil)
        }
    
    @IBAction func playButton(_ sender: Any) {
        introMusic.stop()
    }
    
}


//
//  RestartViewController.swift
//  Pizza Toss
//
//  Created by nd17aak on 11/01/2020.
//  Copyright © 2020 nd17aak. All rights reserved.
//

import UIKit
import AVFoundation

class RestartViewController: UIViewController {

    var passedScore = ""
    var endMusic: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        scorePass.text = self.passedScore
        
        func playMusic() {
            guard let url = Bundle.main.url(forResource: "endMusic", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                endMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let endMusic = endMusic else { return }
                endMusic.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
    playMusic()
        
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        endMusic.stop()
    }
    @IBAction func playAgainButton(_ sender: Any) {
        endMusic.stop()
    }
    @IBOutlet weak var scorePass: UILabel!
    
}

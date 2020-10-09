//
//  RestartViewController.swift
//  Pizza Toss
//
//  Created by nd17aak on 11/01/2020.
//  Copyright © 2020 nd17aak. All rights reserved.
//

import UIKit
import AVFoundation

class FinishedViewController: UIViewController {

    var passedScore = ""
    var finMusic: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var winArray: [UIImage]
            
            winArray = [UIImage(named: "be590639f16f4f8d99f3887529b425d2-0.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-1.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-2.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-3.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-4.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-5.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-6.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-7.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-8.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-9.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-10.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-11.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-12.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-13.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-14.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-15.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-16.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-17.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-18.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-19.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-20.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-21.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-22.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-23.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-24.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-25.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-26.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-27.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-28.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-29.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-30.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-31.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-32.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-33.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-34.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-35.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-36.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-37.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-38.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-39.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-40.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-41.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-42.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-43.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-44.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-45.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-46.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-47.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-48.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-49.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-50.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-51.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-52.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-53.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-54.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-55.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-56.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-57.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-58.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-59.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-60.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-61.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-62.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-63.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-64.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-65.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-66.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-67.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-68.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-69.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-70.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-71.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-72.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-73.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-74.png")!,
                          UIImage(named: "be590639f16f4f8d99f3887529b425d2-75.png")!,]
            
        winAnim.image = UIImage.animatedImage(with: winArray,duration: 4)

        scorePass.text = self.passedScore
        
        func playMusic() {
            guard let url = Bundle.main.url(forResource: "finMusic", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                finMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let endMusic = finMusic else { return }
                endMusic.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
    playMusic()
        
        
    }
    
    @IBOutlet weak var winAnim: UIImageView!
    @IBAction func startButton(_ sender: Any) {
        finMusic.stop()
    }
    @IBAction func playAgainButton(_ sender: Any) {
        finMusic.stop()
    }
    @IBOutlet weak var scorePass: UILabel!
    
}

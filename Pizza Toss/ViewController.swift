//
//  ViewController.swift
//  Pizza Toss
//
//  Created by nd17aak on 10/01/2020.
//  Copyright © 2020 nd17aak. All rights reserved.
//

import UIKit
import AVFoundation

protocol subviewDelegate {
    func createBall()
    func BallAngle(currentLocation: CGPoint)
}

class ViewController: UIViewController, subviewDelegate {
    
    var gameMusic: AVAudioPlayer?
    var throwSound: AVAudioPlayer?
    
    var dynamicAnimator:    UIDynamicAnimator!
    var dynamicItem:        UIDynamicItemBehavior!
    var collisionBehavior:  UICollisionBehavior!
    var objCollision:      UICollisionBehavior!
    
    var vectorX:            CGFloat? = 0
    var vectorY:            CGFloat? = 0
    
    var scoreInt =           0
    
    var countdown = 20
    var time = Timer()
    
    var objArray:          [UIImageView] = []
    var targetVArray:          [UIImageView] = []
    
    let targetIArray =        [UIImage(named: "Picture1.png")!,
                            UIImage(named: "Picture2.png")!,
                            UIImage(named: "Picture3.png")!,
                            UIImage(named: "Picture4.png")!,
                            UIImage(named: "Picture5.png")!]
    
    let W =                 UIScreen.main.bounds.width
    let H =                 UIScreen.main.bounds.height
    
    
    func BallAngle(currentLocation: CGPoint) {
        vectorX = currentLocation.x
        vectorY = currentLocation.y
    }
    
    func createBall() {
        
        playThrowSE()

        let ballImageView =     UIImageView(image: nil)
        
        ballImageView.image =   UIImage(named: "ball.png")
        ballImageView.frame =   CGRect(x: W*0.05,
                                       y: H*0.5,
                                       width: W*0.07,
                                       height: H*0.11)
        self.view.addSubview(ballImageView)
        let ballX = vectorX! - self.TargetImage.bounds.midX
        let ballY = vectorY! - H*0.5
        
        objArray.append(ballImageView)
        dynamicItem.addItem(ballImageView)
        collisionBehavior.addItem(ballImageView)
        dynamicItem.addLinearVelocity(CGPoint(x: ballX*5,
                                              y: ballY*5),
                                            for: ballImageView)
    
        let expire = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: expire) {
            ballImageView.removeFromSuperview()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        startUp()
        self.TargetImage.center.x = self.W * 0.05
        self.TargetImage.center.y = self.H * 0.50
              
        TargetImage.myDelegate = self
         
        dynamicItem = UIDynamicItemBehavior(items: objArray)
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicAnimator.addBehavior(dynamicItem)
        dynamicAnimator.addBehavior(objCollision)
              
        collisionBehavior = UICollisionBehavior(items: [])
        collisionBehavior = UICollisionBehavior(items: objArray)
              
        collisionBehavior.addBoundary(withIdentifier: "LEFTBOUNDARY" as NSCopying, from: CGPoint(x: self.W*0.0, y: self.H*0.0), to: CGPoint(x: self.W*0.0, y: self.H*1.0))
        collisionBehavior.addBoundary(withIdentifier: "TOPBOUNDARY" as NSCopying, from: CGPoint(x: self.W*0.0, y: self.H*0.0), to: CGPoint(x: self.W*1.0, y: self.H*0.0))
        collisionBehavior.addBoundary(withIdentifier: "BOTTOMBOUNDARY" as NSCopying, from: CGPoint(x: self.W*0.0, y: self.H*1.0), to: CGPoint(x: self.W*1.0, y: self.H*1.0))
        dynamicAnimator.addBehavior(collisionBehavior)
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        var sCatArray: [UIImage]
            
            sCatArray = [UIImage(named: "scat1.png")!,
                          UIImage(named: "scat1.png")!,
                          UIImage(named: "scat2.png")!,
                          UIImage(named: "scat3.png")!,
                          UIImage(named: "scat4.png")!,
                          UIImage(named: "scat5.png")!,
                          UIImage(named: "scat6.png")!,
                          UIImage(named: "scat7.png")!,
                          UIImage(named: "scat8.png")!,
                          UIImage(named: "scat9.png")!,
                          UIImage(named: "scat10.png")!,
                          UIImage(named: "scat11.png")!,
                          UIImage(named: "scat12.png")!,
                          UIImage(named: "scat13.png")!,
                          UIImage(named: "scat14.png")!,
                          UIImage(named: "scat15.png")!,
                          UIImage(named: "scat16.png")!,
                          UIImage(named: "scat17.png")!,
                          UIImage(named: "scat18.png")!,
                          UIImage(named: "scat19.png")!,
                          UIImage(named: "scat20.png")!,]
            
        sleepCat.image = UIImage.animatedImage(with: sCatArray,duration: 3)

    }
    
    func createBirdImage(){
        let number = 4
        let birdSize = Int(self.H)/number-2
                   
        for index in 0...1000{
                           
            let when = DispatchTime.now() + (Double(index)/2)
            DispatchQueue.main.asyncAfter(deadline: when) {
                while true {
                    let randomHeight = Int(self.H)/number * Int.random(in: 0...number)
                    let birdView = UIImageView(image: nil)
                    birdView.image = self.targetIArray.randomElement()
                    birdView.frame = CGRect(x: self.W-CGFloat(birdSize),
                                            y:  CGFloat(randomHeight),
                                        width: CGFloat(birdSize),
                                        height: CGFloat(birdSize))
                    self.view.addSubview(birdView)
                    self.view.bringSubviewToFront(birdView)
                    for anyBirdView in self.targetVArray {
                        if
                        birdView.frame.intersects(anyBirdView.frame) {
                        birdView.removeFromSuperview()
                        continue
                        }
              
                    }
                                   
                    self.targetVArray.append(birdView)
                    break;
                    }
                }
            }
    }

        
    func startUp(){
        
        playMusic()
        
        TargetImage.myDelegate = self
        
        ScoreLabel.text = "Score: " + String(scoreInt)
            
        self.createBirdImage()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        TargetImage.frame = CGRect(x:W*0.02, y: H*0.4, width: W*0.2, height: H*0.2)
        
        objCollision = UICollisionBehavior(items: targetVArray)
        
        self.objCollision.action = {
            for ballView in self.objArray{
                for birdView in self.targetVArray{
                    let index = self.targetVArray.firstIndex(of: birdView)
                    if ballView.frame.intersects(birdView.frame)
                    
                    {
                        let picStart = self.view.subviews.count
                        birdView.removeFromSuperview()
                        self.targetVArray.remove(at: index!)
                        let picEnd = self.view.subviews.count
                        
                        if(picStart != picEnd)
                        {
                            self.scoreInt += 1
                        }

                    }
                }
            }
            self.ScoreLabel.text = "Score: " + String(self.scoreInt)
        }
            
        dynamicAnimator.addBehavior(objCollision)
            
            
    }
    
    @objc func countDown(){
        countdown -= 1
        TimerLabel.text = String(countdown)
        
        if(countdown == 0){
            time.invalidate()
            if (scoreInt >= 20){
                gameMusic?.stop()
                nextStage()
            }
            else
            {
                gameMusic?.stop()
                gameOver()
            }
        }
    }
    
    func playMusic() {
        guard let url = Bundle.main.url(forResource: "gameMusic", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            gameMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let gameMusic = gameMusic else { return }
            gameMusic.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    func playThrowSE() {
        guard let url = Bundle.main.url(forResource: "throw", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            throwSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let throwSound = throwSound else { return }
            throwSound.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func gameOver(){
        performSegue(withIdentifier: "passScore", sender: self)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let restart = main.instantiateViewController(withIdentifier: "restartPage")
        self.present(restart, animated: true, completion: nil)
    }
    
    func nextStage(){
        //performSegue(withIdentifier: "passScore", sender: self)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let next = main.instantiateViewController(withIdentifier: "secondStage")
        self.present(next, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let saveScore = segue.destination as! RestartViewController
        saveScore.passedScore = self.ScoreLabel.text!
    }

    
    @IBOutlet weak var sleepCat: UIImageView!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TargetImage: DragImageView!
    @IBOutlet weak var TimerLabel: UILabel!
    
}

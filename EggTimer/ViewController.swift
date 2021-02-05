//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 6, "Hard":9]
    var currentTimer: Int = 0
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet weak var titleView: UILabel!
    
    var player: AVAudioPlayer?
    
    @objc func update(){
        if(secondsPassed < totalTime){
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
        }else{
            titleView.text = "Done!"
            playSound()
            timer.invalidate()
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleView.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)

    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
    }

}

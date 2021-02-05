//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 480, "Hard":720]
    var currentTimer: Int = 0
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        progressBar.progress = 1.0
    }
    
    @objc func update(){
        if(secondsPassed < totalTime){
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageProgress)
            
            secondsPassed += 1
        }else{
            timer.invalidate()
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)

    }

}

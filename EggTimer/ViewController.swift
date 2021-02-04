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
    
    var timer: Timer?
    
    override func viewDidLoad() {
    }
    
    @objc func update(){
        if(currentTimer > 0){
            print(currentTimer)
            currentTimer -= 1
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
        beginTimer(hardness: sender.currentTitle!)
    }
    
    func beginTimer(hardness: String){
        let hardnessTime = eggTimes[hardness]
        currentTimer = hardnessTime ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

}

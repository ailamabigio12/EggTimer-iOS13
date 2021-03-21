//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var doneString: UILabel!
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining = 60
    var secondsCount = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func buttonPresses(_ sender: UIButton) {
        
        timer.invalidate()
        doneString.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        secondsCount = secondsRemaining
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        let bar: Float = 1 / Float(secondsCount)
        
        if secondsRemaining > 0 {
            
            progressBar.progress += bar
            secondsRemaining -= 1
        } else if secondsRemaining == 0 {
            
            timer.invalidate()
            doneString.text = "DONE"
            progressBar.progress = 0
        }
    }
}

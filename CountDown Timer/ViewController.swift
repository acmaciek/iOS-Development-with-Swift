//
//  ViewController.swift
//  CountDown Timer
//
//  Created by Maciek Girek on 5/19/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
  
  var audioPlayer:AVAudioPlayer!
  var timer = Timer()
  var userSetTime = 0
  var alarmSound  = false
  
  func playSound() {
    
    let audioFilePath = Bundle.main.path(forResource: "Alarm", ofType: "mp3")
    if audioFilePath != nil {
      
      let audioFileUrl = NSURL.fileURL(withPath: audioFilePath!)
      
      audioPlayer = try!AVAudioPlayer(contentsOf: audioFileUrl)
      audioPlayer.play()
      
    } else {
      print("audio file is not found")
    }
  }
  
  @IBOutlet weak var label: UILabel!
  
  
  @IBAction func slider(_ sender: UISlider) {
    label.text = String(Int(sender.value)) + " seconds"
    userSetTime = Int(sender.value)
    if(alarmSound == true) {
    audioPlayer.stop()
    }
   }
  @IBAction func pauseButton(_ sender: UIButton) {
    audioPlayer.stop()
    timer.invalidate()
  }
  @IBAction func resetButton(_ sender: UIButton) {
    timer.invalidate()
    audioPlayer.stop()
    label.text = "0"
    userSetTime = 0
    
  }
  
  @IBAction func startButton(_ sender: UIButton) {

    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)

  }
  
  func counter() {
    userSetTime -= 1
    label.text = String(userSetTime) + " seconds"
    
    if(userSetTime <= 0) {
      label.text = " ⏰ TIME IS UP"
      userSetTime = 0
      timer.invalidate()
      playSound()
      alarmSound = true
    }
  }
}


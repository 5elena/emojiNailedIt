//
//  ViewController.swift
//  emojiNailedIt
//
//  Created by Selena on 2018/8/19.
//  Copyright © 2018年 Selena. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Emoji靠近彼此
    @IBOutlet weak var getCloserSlider: UISlider!
    @IBOutlet weak var smileEmoji: UIImageView!
    @IBOutlet weak var loveEmoji: UIImageView!
    
    //SpeechVoice
    @IBOutlet weak var saySomething: UITextField!
    @IBOutlet weak var speedRate: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        loveEmoji.frame.origin.x = CGFloat(30+9*sender.value)
        smileEmoji.frame.origin.x = CGFloat(500-9*sender.value)
    }

    //Speech Rate Slider Change 告白吧 emoji

    @IBAction func speechRateChange(_ sender: Any) {
        saySomething.text = String(speedRate.value)
    }
    @IBAction func buttonPressed(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string: saySomething.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-tw")
        let synthesizer = AVSpeechSynthesizer()
        speechUtterance.rate = speedRate.value*0.05
        synthesizer.speak(speechUtterance)
    }
    
}


//
//  ViewController.swift
//  TimerSample
//
//  Created by cyy on 2017/12/7.
//  Copyright © 2017年 james chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time : Int = 0
    var isStart : Bool = false
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func pauseBtnAction(_ sender: UIBarButtonItem) {
        
        timer.invalidate()
        isStart = false
    }
    
    @IBAction func playBtnAction(_ sender: UIBarButtonItem) {
        
        if !isStart {
            
             timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            // instant fire timer.
            timer.fire()
            isStart = true
            
        }else{
            
            timer.invalidate()
            isStart = false
        }
       
    }
    
    @objc  func processTimer(){
        time += 1
        timerLabel.text = "\(time)"
    }
    
    
    @IBAction func resetAction(_ sender: UIBarButtonItem) {
    
        timer.invalidate()
        time = 0
        isStart = false
        timerLabel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


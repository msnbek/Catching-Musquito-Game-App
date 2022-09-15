//
//  ViewController.swift
//
//  Created by Mahmut Şenbek on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTimeText: UILabel!
    
    @IBOutlet weak var labelScoreText: UILabel!
    
    @IBOutlet weak var mosquito1: UIImageView!
    @IBOutlet weak var mosquito2: UIImageView!
    @IBOutlet weak var mosquito3: UIImageView!
    @IBOutlet weak var mosquito4: UIImageView!
    @IBOutlet weak var mosquito5: UIImageView!
    @IBOutlet weak var mosquito6: UIImageView!
    @IBOutlet weak var mosquito7: UIImageView!
    @IBOutlet weak var mosquito8: UIImageView!
    @IBOutlet weak var mosquito9: UIImageView!
    
    @IBOutlet weak var labelHighscoreText: UILabel!
    
    var score = 0

    var timer = Timer()
    
    var hiddenTimer = Timer()
    
    var counter = 0
    
    var highScore = 0
    
    var mosquitoArray = [UIImageView]()

var button = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hidden Play Button
        
        //code
        
        //Stored Highscore
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighscore == nil {
            
            highScore = 0
            labelHighscoreText.text = "Highscore : \(highScore)"
        }
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            labelHighscoreText.text = "Highscore: \(highScore)"
        }
        // Timer
            counter = 10
        labelTimeText.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(remainingTime), userInfo: nil, repeats: true)
        hiddenTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector((hiddenMosquito)), userInfo: nil, repeats: true)
        
        //image
        
        mosquito1.isUserInteractionEnabled = true
        mosquito2.isUserInteractionEnabled = true
        mosquito3.isUserInteractionEnabled = true
        mosquito4.isUserInteractionEnabled = true
        mosquito5.isUserInteractionEnabled = true
        mosquito6.isUserInteractionEnabled = true
        mosquito7.isUserInteractionEnabled = true
        mosquito8.isUserInteractionEnabled = true
        mosquito9.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(tappedMosquito))
        mosquito1.addGestureRecognizer(gestureRecognizer1)
        mosquito2.addGestureRecognizer(gestureRecognizer2)
        mosquito3.addGestureRecognizer(gestureRecognizer3)
        mosquito4.addGestureRecognizer(gestureRecognizer4)
        mosquito5.addGestureRecognizer(gestureRecognizer5)
        mosquito6.addGestureRecognizer(gestureRecognizer6)
        mosquito7.addGestureRecognizer(gestureRecognizer7)
        mosquito8.addGestureRecognizer(gestureRecognizer8)
        mosquito9.addGestureRecognizer(gestureRecognizer9)
        
        mosquitoArray = [ mosquito1, mosquito2, mosquito3, mosquito4, mosquito5, mosquito6, mosquito7, mosquito8, mosquito9]
        
    hiddenMosquito()

        
        
        
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
    }
    
    
    @objc func hiddenMosquito() {
    for hiddenMosquito in mosquitoArray {
        hiddenMosquito.isHidden = true
    }
    
        let random = Int(arc4random_uniform(UInt32(mosquitoArray.count - 1)))
    
        mosquitoArray[random].isHidden = false  }
    
    //Timer Func
    @objc func remainingTime() {
        counter -= 1
        labelTimeText.text = String(counter)
        // Alert ve Button
        if counter == 0 {
            let alert = UIAlertController(title: "Time's over!", message: "Let's try again!", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true)
            let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(button)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self]
                (UIAlertAction) in
                //for replay
                self.score = 0
                self.labelScoreText.text = " Score: \(self.score)"
                self.counter = 10
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.remainingTime), userInfo: nil, repeats: true)
                self.labelTimeText.text = "\(self.counter)"
                hiddenTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hiddenMosquito), userInfo: nil, repeats: true)
            }
            alert.addAction(replayButton)
        
            timer.invalidate()
            hiddenTimer.invalidate()
           
            for hiddenMosquito in mosquitoArray {
                hiddenMosquito.isHidden = true
            }
            
            
            //highscore control
            if self.score > self.highScore {
                self.highScore = self.score
                labelHighscoreText.text = "High Score : \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
                
            }
            
        }
       
    
    }
    // Image Tapped Func
    @objc func tappedMosquito() {
        print("clicked")
        score += 1
        labelScoreText.text = "Score: \(score)"
        
    }
    
}




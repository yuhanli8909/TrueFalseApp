//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 7
    var questionsAsked = 0
    var correctQuestions = 0
    var seconds = 15
    
    var trivia: Trivia?
    
    var gameSound: SystemSoundID = 0
    
    var timer = Timer()
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    @IBOutlet weak var Option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        
        // Start game
        playGameStartSound()
        displayQuestion()
        displayOptions()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:(#selector(ViewController.updateTimer)), userInfo: nil, repeats: true )
    }
    
    func updateTimer() {
        seconds -= 1
        timerLabel.text = "There are \(seconds)s left"
    }
    
    let triviaList = TriviaList()
    
    //method that shows the Questrion<string> in the questionField
    func displayQuestion() {
        
        self.trivia = triviaList.selectQuestion()
        
        questionField.text = self.trivia?.Question
        playAgainButton.isHidden = true
        
        runTimer()
    }
    
    func displayOptions() {
        
        if (self.trivia?.Options.count == 4) {
            Option1.setTitle(self.trivia?.Options[0], for: UIControlState.normal)
            Option1.tag = 0
            
            Option2.setTitle(self.trivia?.Options[1], for: UIControlState.normal)
            Option2.tag = 1
            
            Option3.setTitle(self.trivia?.Options[2], for: UIControlState.normal)
            Option3.tag = 2
            
            Option4.setTitle(self.trivia?.Options[3], for: UIControlState.normal)
            Option4.tag = 3
        
            Option4.isHidden = false
        }else if(self.trivia?.Options.count == 3){
            Option1.setTitle(self.trivia?.Options[0], for: UIControlState.normal)
            Option1.tag = 0
            
            Option2.setTitle(self.trivia?.Options[1], for: UIControlState.normal)
            Option2.tag = 1
            
            Option3.setTitle(self.trivia?.Options[2], for: UIControlState.normal)
            Option3.tag = 2
            
            Option4.isHidden = true
        }
    }
    
    
    func displayScore() {
        // Hide the answer buttons
        Option1.isHidden = true
        Option2.isHidden = true
        Option3.isHidden = true
        Option4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        timer.invalidate()
        seconds = 15
        timerLabel.text = "There are \(seconds)s left"
        
        if (sender.tag == self.trivia?.correctAnswer) {
            correctQuestions += 1
            questionField.text = "Well Done, the answer is correct!"
        } else {
            questionField.text = "Sorry, wrong answer! The correct answer is \(sender.tag)"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    
    }
    
    func nextRound() {
        if questionsAsked >= questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
            displayOptions()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        Option1.isHidden = false
        Option2.isHidden = false
        Option3.isHidden = false
        Option4.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}




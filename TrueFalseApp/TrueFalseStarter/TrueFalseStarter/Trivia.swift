//
//  Trivia.swift
//  TrueFalseStarter
//
//  Created by Yuhan Li on 22/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Trivia {
    var Question: String
    var Options: Array<String>
    var correctAnswer: Int
    
    init(Question: String, Options: Array<String>, correctAnswer: Int) {
        
        self.Question = Question
        self.Options = Options
        self.correctAnswer = correctAnswer
    }
}

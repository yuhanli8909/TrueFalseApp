//
//  TriviaList.swift
//  TFS
//
//  Created by Yuhan Li on 22/04/2017.
//  Copyright © 2017 Yuhanli. All rights reserved.
//

import Foundation

import GameKit

class TriviaList{
    var triviaArray: Array<Trivia>
    
    init() {
        let trivia01 = Trivia(Question: "This was the only US President to serve more than two consecutive terms.",Options: ["George Washington","Franklin D. Roosevelt","Woodrow Wilson","Andrew Jackson"], correctAnswer: 1)
        
        let trivia02 = Trivia(Question: "Which of the following countries has the most residents?", Options: ["Nigeria","Russia","Iran","Vietnam"], correctAnswer: 0)
        
        let trivia03 = Trivia(Question: "In what year was the United Nations founded?", Options: ["1918","1919","1945","1954"], correctAnswer: 2)
        
        let trivia04 = Trivia(Question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", Options: ["Paris","Washington D.C.","New York City","Boston"], correctAnswer: 2)
        
        triviaArray = [trivia01, trivia02, trivia03, trivia04]
    }
    
    func selectQuestion() -> Trivia {
        let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: triviaArray.count)
        let selectQuestion = triviaArray[indexOfSelectedQuestion]
        return selectQuestion
    }
    
}

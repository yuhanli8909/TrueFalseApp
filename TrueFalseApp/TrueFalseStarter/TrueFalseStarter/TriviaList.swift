//
//  TriviaList.swift
//  TrueFalseStarter
//
//  Created by Yuhan Li on 22/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
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
        
        let trivia05 = Trivia(Question: "Which city is the oldest", Options:["Mexico City","Cape Town","San Juan"],correctAnswer:0)
        
        let trivia06 = Trivia(Question:"Which country was the first to allow women to vote in national elections", Options:["Poland", "United States","Sweden"], correctAnswer:0)
        
        let trivia07 = Trivia(Question:"Which of following rivers is the longest", Options:["Yangtze","Mississippi","Congo"], correctAnswer:1)
        
        triviaArray = [trivia01, trivia02, trivia03, trivia04, trivia05, trivia06, trivia07]
    }
    
    func selectQuestion() -> Trivia {
        let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: triviaArray.count)
        let selectQuestion = triviaArray[indexOfSelectedQuestion]
        
        triviaArray.remove(at: indexOfSelectedQuestion)
        
        return selectQuestion
    }
    
}

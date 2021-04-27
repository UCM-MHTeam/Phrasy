//
//  QuestionList.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/26/21.
//

import Foundation

struct Question {
    var questionString: String?
    var answers: [String]?
}

let QuestionsList: [Question] = [
    Question(questionString: "What did they ask you?",
             answers: ["How are you feeling?", "What do you need right now?", "Is there anything I can do for you?"]),
    Question(questionString: "What best describes what you're feeling now?",
             answers: ["anxious","unhappy","exhausted","angry","worried","afraid","pessimistic","uncomfortable","disappointed","confused","frustrated"]),
    Question(questionString: "What do you need right now?",
             answers: ["some alone time", "someone to vent to", "some company", "to make a decision", "to take action on something"]),
    Question(questionString: "What role can they play for you?", answers: ["give me some space", "listen to me", "accompany me for a while", "provide some input", "refer me to someone that can help"])
]

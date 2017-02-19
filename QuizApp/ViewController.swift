//

// WORKING VERSION

//  ViewController.swift
//  QuizApp
//  GIT_HUB
//  Created by Alex Louzao on 1/15/17.
//  Updated: on 1/23/17
//  Copyright © 2017 ALcsc2310. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!

    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is 7 + 7?", "What is the capitol of VT?", "What is cognac made from?"]
    let answers: [String] = ["14", "Montpelier", "Grapes"]
    var currentQuestion: Int = 0
    
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestion += 1
        if currentQuestion == questions.count{
            currentQuestion = 0
        }
        let question: String = questions[currentQuestion]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransition()
        
    }
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestion]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestion]
    }
    
    func animateLabelTransition(){
       
        UIView.animate(withDuration:0.5, animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1

        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    
}

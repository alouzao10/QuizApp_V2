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
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

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
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    func animateLabelTransition(){
        
        view.layoutIfNeeded()
       
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,&self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,&self.nextQuestionLabelCenterXConstraint)
                        self.updateOffScreenLabel()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    
   /* class func animate(withDuration duration: TimeInterval,
                       delay: TimeInterval,
                       usingSprintWithDamping dampingRatio: CGFloat,
                       initialSpringVelocity velocity: CGFloat,
                       options: UIViewAnimationOptions,
                       animations: () -> Void,
                       completion: ((Bool) -> Void)?)
    */
    
}

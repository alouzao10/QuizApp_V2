//

// WORKING VERSION V2

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
    let answers: [String] = ["14","Montpelier", "Grapes"]
    var currentQuestion: Int = 0
    
    var screenWidth: CGFloat = 0.0 // = view.frame.width
    
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
        screenWidth = view.frame.width
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        //screenWidth = view.frame.width
        let space = UILayoutGuide()
        space.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        print("In update: \(space.layoutFrame.width)")
        nextQuestionLabelCenterXConstraint.constant = -space.layoutFrame.width
        
    }
    
    func animateLabelTransition(){
        
        view.layoutIfNeeded()
        
        //let space = UILayoutGuide()
        //view.addLayoutGuide(space)
       
        //screenWidth = view.frame.width
        
        print("In animate: \(screenWidth)")
        //space.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        //space.trailingAnchor.constraint(equalTo: space.leadingAnchor).isActive = true
        //space.leadingAnchor.constraint(equalTo: space.trailingAnchor).isActive = true

        //print(space.layoutFrame.width)
        
        self.nextQuestionLabelCenterXConstraint.constant = screenWidth/6 //0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth/2 //screenWidth
        
        UIView.animate(withDuration: 2.5,
                       delay: 0,
                       usingSpringWithDamping: 2.5,
                       initialSpringVelocity: 2.5,
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

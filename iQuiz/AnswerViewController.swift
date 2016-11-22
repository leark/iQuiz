//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/15/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var questions = [""]
    var choices = [[""]]
    var answers = [""]
    var questionPointer = 0
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toNextScore(_ sender: AnyObject) {
        
        //if more questions
        if (questionPointer < questions.count - 1) {
// https://itunes.apple.com/us/podcast/cs193p-student-final-projects/id395605774?i=90218598
// http://stackoverflow.com/questions/6164525/self-navigationcontroller-pushviewcontroller-not-working
//            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("questionView") as QuestionViewController
            
//            let question = QuestionViewController()
            // navigationController?.pushViewController(nextViewController, animated: true)
            questionPointer = questionPointer + 1
        } else {
            let score = ScoreViewController()
            // self.show(score, sender: self)
            navigationController?.pushViewController(score, animated: true)
        }
        
        //if done with all games
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ScoreViewController
        controller.questions = questions
        controller.choices = choices
        controller.answers = answers
        controller.questionPointer = questionPointer
        controller.correctCount = correctCount
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

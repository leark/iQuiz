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
    var selected = "0"
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // print(self.navigationController!.viewControllers.count)
        //print(self.navigationController?.viewControllers.count)
        
        //self.navigationController?.viewControllers.removeLast()
        
        
        if (answers[questionPointer] == selected) {
            resultLabel.text = "You are Correct!"
            correctCount += 1
        } else {
            resultLabel.text = "You are Wrong"
        }
        correctLabel.text = "Answer is: \(answers[questionPointer])"
        
        if (questionPointer < questions.count - 1) {
            nextButton.setTitle("Next", for: UIControlState.normal)
        } else {
            nextButton.setTitle("Finished", for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toNextScore(_ sender: AnyObject) {
        if (questionPointer < questions.count - 1) {
            questionPointer += 1
            performSegue(withIdentifier: "QuestionView", sender: self)
        } else {
            performSegue(withIdentifier: "ScoreView", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ScoreView") {
            let controller = segue.destination as! ScoreViewController
            controller.correctCount = correctCount
            controller.numQuestions = questions.count
        } else {
            let controller = segue.destination as! QuestionViewController
            controller.questions = questions
            controller.choices = choices
            controller.answers = answers
            controller.questionPointer = questionPointer
            controller.correctCount = correctCount
        }
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


// https://itunes.apple.com/us/podcast/cs193p-student-final-projects/id395605774?i=90218598
// http://stackoverflow.com/questions/6164525/self-navigationcontroller-pushviewcontroller-not-working
//            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("questionView") as QuestionViewController

//            let question = QuestionViewController()
// navigationController?.pushViewController(nextViewController, animated: true)

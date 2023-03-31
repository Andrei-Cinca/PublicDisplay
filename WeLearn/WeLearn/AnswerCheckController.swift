//
//  AnswerCheckController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 31/03/2023.
//

import Foundation
import UIKit

class AnswerCheckController: UIViewController {

    let questionIndex=0
    let correctAnswerIndex = [0,1,2]
    let answersOne = ["Yes, cloud computing can be done online with no servers", "No, you need physical servers.", "You must have some physical servers only, but not a lot"]
    let answersTwo = ["The nucleus is blue", "The nucleus is transparent ( does not have a color)", "The nuclues has a color but I do not know it"]
    let answersThree = ["Sigmund Freud means that we should be able to do it", "Freud wants to say that we cannot do it because we do not want it enough", "Freud is saying that it goes pat out capacity to view such a scenario since we would eventually cast someone else in that position"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if questionIndex == 0 {
            questionLabel.text = "Do you need physical servers to use a cloud computing service?"
            option1Button.setTitle(answersOne[0], for: .normal)
            option2Button.setTitle(answersOne[1], for: .normal)
            option3Button.setTitle(answersOne[2], for: .normal)
        }
        if questionIndex == 1 {
            questionLabel.text = "What color is the nucleus of a cell?"
            option1Button.setTitle(answersTwo[0], for: .normal)
            option2Button.setTitle(answersTwo[1], for: .normal)
            option3Button.setTitle(answersTwo[2], for: .normal)
        }
        if questionIndex == 2 {
            questionLabel.text = "what does Sigmund Freud mean by this: “we cannot represent our own death because in trying to do so, we are always still left as spectators”"
            option1Button.setTitle(answersThree[0], for: .normal)
            option2Button.setTitle(answersThree[1], for: .normal)
            option3Button.setTitle(answersThree[2], for: .normal)
        }
        
    }

    @IBAction func option1Selected(_ sender: UIButton) {
        checkAnswer(0)
    }

    @IBAction func option2Selected(_ sender: UIButton) {
        checkAnswer(1)
    }

    @IBAction func option3Selected(_ sender: UIButton) {
        checkAnswer(2)
    }

    func checkAnswer(_ selectedAnswerIndex: Int) {
        if selectedAnswerIndex == correctAnswerIndex[0] {
            displayMessage("Correct Answer! Congratulations")
        } else {
            displayMessage("Incorrect Answer. Refer to the Hints or Guidance if you need help with the topic.")
        }
    }

    func displayMessage(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


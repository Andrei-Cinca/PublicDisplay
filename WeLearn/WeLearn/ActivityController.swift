//
//  ActivityController.swift
//  WeLearn
//
//  Created by Andrei Cinca 
//
// this page handles the Activity screen, with functionalities such as check answer, ask for help or guidance

import Foundation
import Speech
import UIKit

class ActivityController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    let imageNames = ["compsc.jpeg", "biol 1.jpeg", "phil 1.jpeg"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb2.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Set the initial image
        imageView.image = UIImage(named: imageNames[currentIndex])
        if currentIndex == 0 {
            labelView.text = " Computer Science "
        }
        if currentIndex == 1 {
            labelView.text = " Biology "
        }
        if currentIndex == 2 {
            labelView.text = " Philosophy "
        }
        
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Increase the index
        currentIndex = (currentIndex + 1) % imageNames.count

        // Set the correct image
        imageView.image = UIImage(named: imageNames[currentIndex])
        if currentIndex == 0 {
            labelView.text = " Computer Science "
        }
        if currentIndex == 1 {
            labelView.text = " Biology "
        }
        if currentIndex == 2 {
            labelView.text = " Philosophy "
        }
    }

    @IBAction func prevButtonTapped(_ sender: UIButton) {
        // Decrease the index
        currentIndex = (currentIndex + imageNames.count - 1) % imageNames.count

        //set image
        imageView.image = UIImage(named: imageNames[currentIndex])
        if currentIndex == 0 {
            labelView.text = " Computer Science "
        }
        if currentIndex == 1 {
            labelView.text = " Biology "
        }
        if currentIndex == 2 {
            labelView.text = " Philosophy "
        }
    }
    //prepare for next screen transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showHelp" {
                let destinationVC = segue.destination as! HelpDestinationViewController
                if currentIndex == 0 {
                    destinationVC.data = " Computer Science "
                }
                if currentIndex == 1 {
                    destinationVC.data = " Biology "
                }
                if currentIndex == 2 {
                    destinationVC.data = " Philosophy "
                }
            }
            if segue.identifier == "showHint" {
                let destinationVC = segue.destination as! HintDestinationViewController
                if currentIndex == 0 {
                    destinationVC.data = " cloud computing is the delivery of computing services—including servers, storage, databases, networking, software, analytics, and intelligence—over the Internet (“the cloud”) to offer faster innovation, flexible resources, and economies of scale. "
                }
                if currentIndex == 1 {
                    destinationVC.data = "In biology, the smallest unit that can live on its own and that makes up all living organisms and the tissues of the body. A cell has three main parts: the cell membrane, the nucleus, and the cytoplasm. the nucleus is almost completely transparent and colorless "
                }
                if currentIndex == 2 {
                    destinationVC.data = " Freud makes the philosophical argument that we cannot represent our own death because in trying to do so, we are always still left as spectators. When he says that you can't represent your own death he means that the scenario you imagine of your own death  is a scenario responding to your own desires."
                }
            }
        
                if segue.identifier == "checkAnswer" {
                    let destinationVC = segue.destination as! AnswerCheckViewController
                    if currentIndex == 0 {
                        destinationVC.questionIndex = currentIndex
                        destinationVC.correctAnswerIndex=0
                    }
                    if currentIndex == 1 {
                        destinationVC.questionIndex = currentIndex
                        destinationVC.correctAnswerIndex=1
                    }
                    if currentIndex == 2 {
                        destinationVC.questionIndex = currentIndex
                        destinationVC.correctAnswerIndex=2
                    }
                }
        
        }
}

// destination controller for when users ask for guidance
class HelpDestinationViewController: UIViewController {

    var data: String?
    @IBOutlet var textView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text=data
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "helpb.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
      
        if let data = data {
            print(data)
        }
    }

}

//destination controller for when users ask for a hint
class HintDestinationViewController: UIViewController {

    var data: String?
    @IBOutlet var textView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text=data

        if let data = data {
            print(data)
        }
    }

}

// destination controller for checking the answers for a topic
class AnswerCheckViewController: UIViewController {

    var questionIndex=0
    var correctAnswerIndex = 0
    let answersOne = ["Yes, cloud computing can be done online with no servers", "No, you need physical servers.", "You must have some physical servers only, but not a lot"]
    let answersTwo = ["The nucleus is blue", "The nucleus is transparent ( does not have a color)", "The nuclues has a color but I do not know it"]
    let answersThree = ["Sigmund Freud means that we should be able to do it", "Freud wants to say that we cannot do it because we do not want it enough", "Freud is saying that it goes pat out capacity to view such a scenario since we would eventually cast someone else in that position"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var feedbackLabel: UITextView!

    var failedAnswers = 0
    var goodAnswers = 0
    
    override func viewDidLoad() {
        //setting up the page
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
    
    // prints feedback relevant to the answer given
    func showFeedback(_ gAnswers: Int, _ wAnswers: Int){
        if gAnswers > 0 {
            feedbackLabel.text="Congratulations! The answer is correct. Move to the next topic."
            feedbackLabel.isEditable=false
        }
        else {
            if wAnswers > 0 {
                feedbackLabel.text="The answer is incorrect. See Hints or ask for Guidance."
            }
        }
    }
    //when button one is tapped
    @IBAction func option1Selected(_ sender: UIButton) {
        checkAnswer(0,sender)
        showFeedback(goodAnswers, failedAnswers)
    }
    //when button two is tapped
    @IBAction func option2Selected(_ sender: UIButton) {
        checkAnswer(1,sender)
        showFeedback(goodAnswers, failedAnswers)
    }
    //when button three is tapped
    @IBAction func option3Selected(_ sender: UIButton) {
        checkAnswer(2,sender)
        showFeedback(goodAnswers, failedAnswers)
    }
    //function meant to verify the validity of the answers
    func checkAnswer(_ selectedAnswerIndex: Int, _ btn: UIButton) {
        if selectedAnswerIndex == correctAnswerIndex {
            goodAnswers = goodAnswers + 1
            
            btn.backgroundColor = UIColor.green
            option1Button.isEnabled = false
            option2Button.isEnabled = false
            option3Button.isEnabled = false
//            UIView.animate(withDuration: 4, animations: {
//                btn.backgroundColor = UIColor.white
//            }, completion: { (completed) in
//                self.option1Button.isEnabled = true
//                self.option2Button.isEnabled = true
//                self.option3Button.isEnabled = true
//            })
        } else {
            failedAnswers = failedAnswers + 1
          
            btn.backgroundColor = UIColor.red
            option1Button.isEnabled = false
            option2Button.isEnabled = false
            option3Button.isEnabled = false
            UIView.animate(withDuration: 3, animations: {
                btn.backgroundColor = UIColor.white
            }, completion: { (completed) in
                self.option1Button.isEnabled = true
                self.option2Button.isEnabled = true
                self.option3Button.isEnabled = true
            })
        }
    }

}



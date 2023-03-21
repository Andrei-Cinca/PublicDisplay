//
//  ActivityController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 08/03/2023.
//

import Foundation
import Speech
import UIKit

class ActivityController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    let imageNames = ["img01.png", "img02.png", "img03.png"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb2.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Set the initial image
        imageView.image = UIImage(named: imageNames[currentIndex])
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Increment the index and wrap around if necessary
        currentIndex = (currentIndex + 1) % imageNames.count

        // Set the new image
        imageView.image = UIImage(named: imageNames[currentIndex])
    }

    @IBAction func prevButtonTapped(_ sender: UIButton) {
        // Decrement the index and wrap around if necessary
        currentIndex = (currentIndex + imageNames.count - 1) % imageNames.count

        // Set the new image
        imageView.image = UIImage(named: imageNames[currentIndex])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showHelp" {
                let destinationVC = segue.destination as! HelpDestinationViewController
                if currentIndex == 0 {
                    destinationVC.data = " Addition "
                }
                if currentIndex == 1 {
                    destinationVC.data = " Multiplication "
                }
                if currentIndex == 2 {
                    destinationVC.data = " Division "
                }
            }
            if segue.identifier == "showHint" {
                let destinationVC = segue.destination as! HintDestinationViewController
                if currentIndex == 0 {
                    destinationVC.data = " When calculating the addition between two numbers keep in mind that we must combine the values and calculate the result, for instance 2+2=4 "
                }
                if currentIndex == 1 {
                    destinationVC.data = "Multiplication is a mathematical operation used to find the product of two or more numbers. The result of multiplication is called the product. For example, the product of 4 and 3 is 12. "
                }
                if currentIndex == 2 {
                    destinationVC.data = " Division is a mathematical operation used to divide a number into equal parts. The number being divided is called the dividend, and the number of equal parts that it is divided into is called the divisor. The result of division is called the quotient. For example, if 12 is divided into 3 equal parts, each part would be 4, so the quotient is 4."
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

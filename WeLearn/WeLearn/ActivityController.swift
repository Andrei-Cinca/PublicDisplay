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
        // Increment the index and wrap around if necessary
        currentIndex = (currentIndex + 1) % imageNames.count

        // Set the new image
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
        // Decrement the index and wrap around if necessary
        currentIndex = (currentIndex + imageNames.count - 1) % imageNames.count

        // Set the new image
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

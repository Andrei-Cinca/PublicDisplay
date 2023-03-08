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
                let destinationVC = segue.destination as! DestinationViewController
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
        }
}


class DestinationViewController: UIViewController {

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


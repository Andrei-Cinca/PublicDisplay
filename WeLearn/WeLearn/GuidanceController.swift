//
//  GuidanceController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 14/03/2023.
//

import Foundation
import UIKit

class GuidanceController: UIViewController {
    @IBOutlet var textView:UITextView!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var directionButton:UIButton!
    var currentIndex=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = " Exit the class. Go left."
        imgView.image = UIImage(named: locationsNames[currentIndex])
       
    }
    let locationsNames = ["loc1.png", "loc2.png", "loc3.png", "geom.png"]
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Increment the index and wrap around if necessary
        currentIndex = currentIndex + 1

        // Set the new image
        imgView.image = UIImage(named: locationsNames[currentIndex])
        
    
        if currentIndex == 1 {
            textView.text = "Climb the stairs to level 2"
        }
        if currentIndex == 2 {
            textView.text = "Walk forward. Third door on the left ( 205)"
        }
        if currentIndex == 3 {
            textView.text = "Congratulations you have reached the next class. Enjoy your geometry class."
        }
        
        
    }
    
    
    
}

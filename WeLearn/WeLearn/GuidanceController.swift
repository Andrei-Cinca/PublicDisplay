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
    @IBOutlet var nextStepButton:UIButton!
    @IBOutlet var previousStepButton: UIButton!
    var currentIndex=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = " Exit the class. Go left. Climb down one flight of stairs"
        imgView.image = UIImage(named: locationsNames[currentIndex])
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb2.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
       
    }
    let locationsNames = ["bh01.pdf", "bh02.pdf", "bh03.pdf", "bh04.pdf"]
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Increment the index and wrap around if necessary
        print("moved forward")
        currentIndex = currentIndex + 1
        
        //maintain the state of the two buttons
        if currentIndex == 0 {
            previousStepButton.isEnabled=false
            textView.text = " Exit the class. Go left. Climb down one flight of stairs"
        }
        else{
            previousStepButton.isEnabled=true
        }
        if currentIndex == 3{
            nextStepButton.isEnabled=false
        }
        else{
            nextStepButton.isEnabled=true
        }
        
        
        // Set the new image
        imgView.image = UIImage(named: locationsNames[currentIndex])
        
    
        if currentIndex == 1 {
            textView.text = "Take a left. Go through the door"
        }
        if currentIndex == 2 {
            textView.text = "Go right. Keep going forward until you see room 5.20 "
        }
        if currentIndex == 3 {
            textView.text = "Congratulations you have reached the next class. Enjoy your CS1 class."        }
        
        
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        // Decrement the index and wrap around if necessary
        print("moved back")
        currentIndex = currentIndex - 1
        
        //maintain the state of the two buttons
        if currentIndex == 0 {
            textView.text = " Exit the class. Go left. Climb down one flight of stairs"
            previousStepButton.isEnabled=false
        }
        else{
            previousStepButton.isEnabled=true
        }
        if currentIndex == 3{
            nextStepButton.isEnabled=false
        }
        else{
            nextStepButton.isEnabled=true
        }
        
        // Set the new image
        imgView.image = UIImage(named: locationsNames[currentIndex])
        
        
        if currentIndex == 1 {
            textView.text = "Take a left. Go through the door"
        }
        if currentIndex == 2 {
            textView.text = "Go right. Keep going forward until you see room 5.20 "
        }
        if currentIndex == 3 {
            textView.text = "Congratulations you have reached the next class. Enjoy your CS1 class."
        }
        
        
    }
    
    // resetting the counter and picture
    @IBAction func resetCounter(_ sender: UIButton){
        currentIndex=0
        imgView.image = UIImage(named: locationsNames[currentIndex])
        nextStepButton.isEnabled=true
        textView.text = " Exit the class. Go left. Climb down one flight of stairs"
    }
    
    
    
}

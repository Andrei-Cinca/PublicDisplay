//
//  ColourGameController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 13/03/2023.
//

import UIKit
import Foundation
class ColourGameController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet var buttonTapped:UIButton!
    @IBOutlet var textView:UITextView!
    var timeElapsed = 0
    var clicks = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the initial image
        
    }
    
    @IBAction func changeColour(_ sender: UIButton){
        clicks=clicks+1
        if clicks < 10 {
            let randomColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
            colorView.backgroundColor = randomColor
        }
        else{
            textView.text="Great Job!  Now that we have recovered our focus, let us go back to studying"
            
            buttonTapped.isEnabled=false
            
        }
    }
}

//
//  ScheduleController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 08/03/2023.
//

import Foundation
import Speech
import UIKit

class ScheduleController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb1.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "TasksDestinationViewController")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func showPopupMon(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Monday's Activity", message: "Today's activities will be focused around literature", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func showPopupTue(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Tuesday's Activity", message: "Today's activities will be focused around chemistry", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func showPopupWed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Wednesday's Activity", message: "Today's activities will be focused around mathematics", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func showPopupThu(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Thursday's Activity", message: "Today's activities will be focused around physics", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func showPopupFri(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Friday's Activity", message: "Today's activities will be focused around sports", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }


}


class TasksDestinationViewController: UIViewController {

    
    @IBOutlet var buttonOne:UIButton!
    @IBOutlet var buttonTwo:UIButton!
    @IBOutlet var buttonThree:UIButton!
    @IBOutlet var buttonFour:UIButton!
    var tintOneColor: UIColor?
    var tintTwoColor: UIColor?
    var tintThreeColor: UIColor?
    var tintFourColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb1.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        if let colorOne = tintOneColor {
                    buttonOne.tintColor = colorOne
                }
        
        
    }
    
    @IBAction func buttonOneTapped (_ sender: UIButton){
        buttonOne.tintColor = UIColor.green
        tintOneColor = UIColor.green
    }
    @IBAction func buttonTwoTapped (_ sender: UIButton){
        buttonTwo.tintColor = UIColor.green
    }
    @IBAction func buttonThreeTapped (_ sender: UIButton){
        buttonThree.tintColor = UIColor.green
    }
    @IBAction func buttonFourTapped (_ sender: UIButton){
        buttonFour.tintColor = UIColor.green
    }
    

}

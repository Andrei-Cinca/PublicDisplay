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
        let alertController = UIAlertController(title: "Monday's Activity", message: "Today's activities will be focused around reading, writing and comprehending literature.", preferredStyle: .alert)
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

//
// class for the screen that handles progress checking
//
class TasksDestinationViewController: UIViewController {

    
    
    @IBOutlet var buttonOne:UIButton!
    @IBOutlet var buttonTwo:UIButton!
    @IBOutlet var buttonThree:UIButton!
    @IBOutlet var buttonFour:UIButton!
    
    var tintOneColor: UIColor?
    var tintTwoColor: UIColor?
    var tintThreeColor: UIColor?
    var tintFourColor: UIColor?
    
    @IBOutlet weak var progressView: UIProgressView!
    var progressValue: Float = 0.0
    
 
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Retrieve the button color and enabled state from UserDefaults
            let defaults = UserDefaults.standard
        if let colorData = defaults.data(forKey: "buttonOneColor"),
        let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
            buttonOne.tintColor = color
         }
        if buttonOne.tintColor == UIColor.green{
            buttonOne.isUserInteractionEnabled = defaults.bool(forKey: "buttonOneEnabled")
        }
        
        if let colorData = defaults.data(forKey: "buttonTwoColor"),
           let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
            buttonTwo.tintColor = color
        }
        if buttonTwo.tintColor == UIColor.green{
            buttonTwo.isUserInteractionEnabled = defaults.bool(forKey: "buttonTwoEnabled")
        }
        
        if let colorData = defaults.data(forKey: "buttonThreeColor"),
           let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
            buttonThree.tintColor = color
        }
        if buttonThree.tintColor == UIColor.green{
            buttonThree.isUserInteractionEnabled = defaults.bool(forKey: "buttonThreeEnabled")
        }
        
        if let colorData = defaults.data(forKey: "buttonFourColor"),
           let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
            buttonFour.tintColor = color
        }
        if buttonFour.tintColor == UIColor.green{
            buttonFour.isUserInteractionEnabled = defaults.bool(forKey: "buttonFourEnabled")
        }
        
       
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let prog = defaults.float(forKey: "progressBarValue")
        print(prog)
        //progressView.progress = progressValue
        progressView.setProgress(prog, animated: true)
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cb1.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        
    }
    
    @IBAction func resetProgress (_sender: UIButton)
    {
        let defaults = UserDefaults.standard
        let colorOne = try? NSKeyedArchiver.archivedData(withRootObject: UIColor.systemBlue, requiringSecureCoding: false)
        defaults.set(colorOne, forKey: "buttonOneColor")
        
        let colorTwo = try? NSKeyedArchiver.archivedData(withRootObject: UIColor.systemBlue, requiringSecureCoding: false)
        defaults.set(colorTwo, forKey: "buttonTwoColor")
        
        let colorThree = try? NSKeyedArchiver.archivedData(withRootObject: UIColor.systemBlue, requiringSecureCoding: false)
        defaults.set(colorThree, forKey: "buttonThreeColor")
        
        let colorFour = try? NSKeyedArchiver.archivedData(withRootObject: UIColor.systemBlue, requiringSecureCoding: false)
        defaults.set(colorFour, forKey: "buttonFourColor")
        
        defaults.set(0.0,forKey: "progressBarValue")
    }
    
    @IBAction func buttonOneTapped (_ sender: UIButton){
        let defaults = UserDefaults.standard
        progressValue=defaults.float(forKey: "progressBarValue")
        progressValue += 0.25
        progressView.setProgress(progressValue, animated: true)
        defaults.set(progressValue, forKey: "progressBarValue")
        buttonOne.tintColor = UIColor.green
        tintOneColor = UIColor.green
        buttonOne.isUserInteractionEnabled=false
        
        let colorData = try? NSKeyedArchiver.archivedData(withRootObject: buttonOne.tintColor!, requiringSecureCoding: false)
        defaults.set(colorData, forKey: "buttonOneColor")
        defaults.set( buttonOne.isUserInteractionEnabled, forKey: "buttonOneEnabled")
        if progressValue == 1 {
            let alertController = UIAlertController(title: "Tasks Completed", message: "Congratulations, you finished all of your goals for today!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func buttonTwoTapped (_ sender: UIButton){
        let defaults = UserDefaults.standard
        progressValue=defaults.float(forKey: "progressBarValue")
        progressValue += 0.25
        progressView.setProgress(progressValue, animated: true)
        defaults.set(progressValue, forKey: "progressBarValue")
        buttonTwo.tintColor = UIColor.green
        buttonTwo.isUserInteractionEnabled=false
     
        let colorData = try? NSKeyedArchiver.archivedData(withRootObject: buttonTwo.tintColor!, requiringSecureCoding: false)
        defaults.set(colorData, forKey: "buttonTwoColor")
        defaults.set( buttonTwo.isUserInteractionEnabled, forKey: "buttonTwoEnabled")
        
        if progressValue == 1 {
            let alertController = UIAlertController(title: "Tasks Completed", message: "Congratulations, you finished all of your goals for today!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func buttonThreeTapped (_ sender: UIButton){
        let defaults = UserDefaults.standard
        buttonThree.tintColor = UIColor.green
        progressValue=defaults.float(forKey: "progressBarValue")
        progressValue += 0.25
        progressView.setProgress(progressValue, animated: true)
        defaults.set(progressValue, forKey: "progressBarValue")
        buttonThree.isUserInteractionEnabled=false
        let colorData = try? NSKeyedArchiver.archivedData(withRootObject: buttonThree.tintColor!, requiringSecureCoding: false)
        defaults.set(colorData, forKey: "buttonThreeColor")
        defaults.set( buttonThree.isUserInteractionEnabled, forKey: "buttonThreeEnabled")
        
        if progressValue == 1 {
            let alertController = UIAlertController(title: "Tasks Completed", message: "Congratulations, you finished all of your goals for today!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    @IBAction func buttonFourTapped (_ sender: UIButton){
        let defaults = UserDefaults.standard
        buttonFour.tintColor = UIColor.green
        progressValue=defaults.float(forKey: "progressBarValue")
        progressValue += 0.25
        progressView.setProgress(progressValue, animated: true)
        buttonFour.isUserInteractionEnabled=false
        defaults.set(progressValue, forKey: "progressBarValue")
        let colorData = try? NSKeyedArchiver.archivedData(withRootObject: buttonFour.tintColor!, requiringSecureCoding: false)
        defaults.set(colorData, forKey: "buttonFourColor")
        defaults.set( buttonFour.isUserInteractionEnabled, forKey: "buttonFourEnabled")
        
        if progressValue == 1 {
            let alertController = UIAlertController(title: "Tasks Completed", message: "Congratulations, you finished all of your goals for today!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    

}

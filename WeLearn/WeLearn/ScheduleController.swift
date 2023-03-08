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


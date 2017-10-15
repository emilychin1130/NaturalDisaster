//
//  AddFoodViewController.swift
//  NaturalDisaster
//
//  Created by Emily Chin on 10/14/17.
//  Copyright © 2017 Emily Chin. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class AddFoodViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selector: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            let items = CoreDataHelper.retrieveFood()
            var listOfFood = [String]()
            for item in items {
                listOfFood.append(item.name!)
            }
            if (nameTextField.text?.isEmpty)! {
                let alert = UIAlertController(title: "", message: "You forgot to add a name!" , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Add a name", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil) } ) )
                self.present(alert, animated: true, completion: nil)
//            } else
//                if isEdit == false {
//                    if listOfFood.contains(nameTextField.text!) {
//                        let alert = UIAlertController(title: "", message: "You already have an item called \(String(describing: nameTextField.text!))." , preferredStyle: UIAlertControllerStyle.alert)
//                        alert.addAction(UIAlertAction(title: "Rename", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil) } ) )
//                        self.present(alert, animated: true, completion: nil)
//                    } else {
//                        
//                        let item = self.name ?? CoreDataHelper.newItem()
//                        if item.name != nil {
//                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [habit.habit!])
//                        }
//                        item.name = nameTextField.text ?? ""
//                        item.expDate = datePicker ?? ""
//                        CoreDataHelper.saveFood()
//                    }
            
                } else {
                    
                    let item = CoreDataHelper.newFood()
                    if item.name != nil {
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
                    }
                    item.name = nameTextField.text ?? ""
                
                    let date = datePicker.date
                    let components = Calendar.current.dateComponents([.month, .day, .year], from: date)
                    let month = components.month!
                    let day = components.day!
                    let year = components.year!
                    item.expDate = "\(month)/\(day)/\(year)" ?? ""
                
                    switch selector.selectedSegmentIndex {
                        case 0:
                            item.have = true
                        case 1:
                            item.have = false
                        default:
                            break

                    }
                    CoreDataHelper.saveFood()
            }
            
        }
    }

}

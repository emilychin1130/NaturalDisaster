//
//  CoreDataHelper.swift
//  NaturalDisaster
//
//  Created by Emily Chin on 10/14/17.
//  Copyright © 2017 Emily Chin. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import UserNotifications

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    //FOOD
    
    static func newFood() -> Food {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Food", into: managedContext) as! Food
        return item
    }
    
    static func saveFood() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: Food) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        saveFood()
    } //idk if need this at all and how to adjust it
    
    static func retrieveFood() -> [Food] {
        let fetchRequest = NSFetchRequest<Food>(entityName: "Food")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
    
    //FIRST AID
    
    static func newFirstAid() -> FirstAid {
        let item = NSEntityDescription.insertNewObject(forEntityName: "FirstAid", into: managedContext) as! FirstAid
        return item
    }
    
    static func saveFirstAid() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: FirstAid) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        saveFirstAid()
    } //idk if need this at all and how to adjust it
    
    static func retrieveFirstAid() -> [FirstAid] {
        let fetchRequest = NSFetchRequest<FirstAid>(entityName: "FirstAid")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
    
    //PAPERS
    
    static func newPapers() -> Papers {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Papers", into: managedContext) as! Papers
        return item
    }
    
    static func savePapers() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: Papers) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        savePapers()
    } //idk if need this at all and how to adjust it
    
    static func retrievePapers() -> [Papers] {
        let fetchRequest = NSFetchRequest<Papers>(entityName: "Papers")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
    
    //UTILITIES
    
    static func newUtilities() -> Utilities {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Utilities", into: managedContext) as! Utilities
        return item
    }
    
    static func saveUtilities() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: Utilities) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        saveUtilities()
    } //idk if need this at all and how to adjust it
    
    static func retrieveUtilities() -> [Utilities] {
        let fetchRequest = NSFetchRequest<Utilities>(entityName: "Utilities")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
    
    //CLOTHES
    
    static func newClothes() -> Clothes {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Clothes", into: managedContext) as! Clothes
        return item
    }
    
    static func saveClothes() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: Clothes) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        saveClothes()
    } //idk if need this at all and how to adjust it
    
    static func retrieveClothes() -> [Clothes] {
        let fetchRequest = NSFetchRequest<Clothes>(entityName: "Clothes")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
    
    //OTHERS
    
    static func newOthers() -> Others {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Others", into: managedContext) as! Others
        return item
    }
    
    static func saveOthers() {
        do {
            try managedContext.save()
        } catch let error as NSError {
        }
    }
    
    static func delete(item: Others) {
        managedContext.delete(item)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.name!])
        saveOthers()
    } //idk if need this at all and how to adjust it
    
    static func retrieveOthers() -> [Others] {
        let fetchRequest = NSFetchRequest<Others>(entityName: "Others")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
        }
        return []
    }
}

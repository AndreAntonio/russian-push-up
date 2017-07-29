//
//  Vladmir.swift
//  russian-push-up
//
//  Created by Julio Brazil on 10/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import UserNotifications

public class Vladmir {
    
    var managedContext: NSManagedObjectContext? = nil
    
    var day: Int = 0
    var startDate: Date
    
    var max: Int = 0
    
    let program: [(Double, Int)] = [(0.30, 60),
                                    (0.50, 60),
                                    (0.60, 45),
                                    (0.25, 60),
                                    (0.45, 30),
                                    (0.40, 60),
                                    (0.20, 90),
                                    
                                    (0.35, 45),
                                    (0.55, 20),
                                    (0.30, 15),
                                    (0.65, 60),
                                    (0.35, 45),
                                    (0.45, 20),
                                    (0.25, 120)]
    
    var totalAmount: Int = 0
    
    private init() {
        self.startDate = Date()
        var temp: [NSManagedObject] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        self.managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        
        do {
            temp = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if temp.count > 0 {
            self.startDate = temp[temp.count - 1].value(forKey: "startDate") as! Date
            self.max = temp[temp.count - 1].value(forKey: "max") as! Int
            
            //temp[temp.count - 1]
            
            self.day = self.startDate.interval(ofComponent: .day, fromDate: Date())
        }
    }
    
    public func setMax(to max: Int) {
        self.startDate = Date()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)!
        let saveDate = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // 3
        saveDate.setValue(Date(), forKeyPath: "startDate")
        saveDate.setValue(max, forKeyPath: "max")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    public func scheduleNextNotification() {
        //TODO: schedule the reminders for the Day
        self.setNotification(title: "TITLE", subtitle: "Time to do \(Int(self.program[day].0 * Double(self.max))) push ups", body: "BODY", badge: 1, withIdentifier: "NOTIFICATION", notificationTrigger: UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(self.program[day].1 * 60), repeats: true))
    }
    
    public func scheduleBreack() {
        //TODO: deschedule all notifications, then schedule reminders to deactivate the breack
        var components = DateComponents()
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.date(byAdding: .hour, value: 8, to: Date())
        components.day = calendar.component(.day, from: date!)
        components.hour = calendar.component(.hour, from: date!)
        components.minute = calendar.component(.minute, from: date!)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        self.setNotification(title: "TITLE", subtitle: "Subtitle", body: "Body", badge: 1, withIdentifier: "REMINDER", notificationTrigger: UNCalendarNotificationTrigger(dateMatching: components, repeats: false))
    }
    
    func setNotification(title: String, subtitle: String, body: String, badge: Int, withIdentifier identifier: String, notificationTrigger trigger: UNNotificationTrigger) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = badge as NSNumber
        
        //        let repeatAction = UNNotificationAction(identifier:"repeat", title:"Repeat",options: [])
        
        //        let changeAction = UNTextInputNotificationAction(identifier: "change", title: "Change Message", options: [])
        
        let category = UNNotificationCategory(identifier: "actionCategory", actions: [] /*[repeatAction, changeAction]*/, intentIdentifiers: [], options: [])
        
        content.categoryIdentifier = "actionCategory"
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //let triggerDate = trigger
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let requestIdentifier = identifier
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            if let _ = error {
                print("error \"\(String(describing: error))\" occured while trying to schedule a notification with identifier: \(identifier)")
            }
        })
    }
}

extension Date {
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
}

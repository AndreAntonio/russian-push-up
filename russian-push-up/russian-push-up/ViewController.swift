//
//  ViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 10/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var timer = Timer()
    var timeRemaining: Int = 0
    
    // Esse outlet é responsavel por apresentar ao usuario a semana do programa em que ele atualmente se encontra.
    @IBOutlet weak var weekOutlet: UILabel!
    
    // Esse outlet é responsavel por apresentar ao usuario o dia da semana (segunda, terça etc...) em que o usuario se encontra, sem relação ao programa.
    @IBOutlet weak var weekDayOutlet: UILabel!
    
    // Esse outlet representa o dia do programa em que ele se encontra. ( Ex : segundo dia)
    @IBOutlet weak var dayOutlet: UILabel!
    
    // Esse outlet representa o maximo de flexões do usuario, atualmente. A medida que novos testes forem feitos, o maximo aumenta.
    @IBOutlet weak var currentMaximumOutlet: UILabel!
    
    // Esse outlet representa a relative intensity correspondente ao dia/semana do programa que o usuario se encontra.
    @IBOutlet weak var relativeIntensityOutlet: UILabel!
    
    // Esse outlet representa o numero de PushUps que o usuario deverá fazer em seguida. Depende diretamente de seu maximo e de sua relative intensity.
    @IBOutlet weak var psOutlet: UILabel!
    
    // Esse outlet representa quantos minutos faltam para a proxima flexao.
    @IBOutlet weak var MinOutlet: UILabel!
    
    // Esse Outlet representa a casa dos segundos do outlet acima.
    @IBOutlet weak var SecOutlet: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        //Vladmir.sharedInstance.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vlad = Vladmir.sharedInstance
        let day = vlad.day
        self.dayOutlet.text = "day number \(day + 1)"
        
        if day + 1 > 7 {
            self.weekDayOutlet.text = "2nd Week"
        } else {
            self.weekDayOutlet.text = "1st Week"
        }
        
        self.currentMaximumOutlet.text = "\(vlad.max)"
        self.relativeIntensityOutlet.text = "\(Int(vlad.program[day].0 * Double(100)))%"
        self.psOutlet.text = "\(Int(vlad.program[day].0 * Double(vlad.max)))"
        
        switch Calendar(identifier: .gregorian).component(.weekday, from: Date()) {
        case 0:
            self.weekDayOutlet.text = "Sunday"
        case 1:
            self.weekDayOutlet.text = "Monday"
        case 2:
            self.weekDayOutlet.text = "Tuesday"
        case 3:
            self.weekDayOutlet.text = "Wednesday"
        case 4:
            self.weekDayOutlet.text = "Thursday"
        case 5:
            self.weekDayOutlet.text = "Friday"
        default:
            self.weekDayOutlet.text = "Saturday"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToScheduleTapped(_ sender: Any) {
        
        // Essa action é responsavel por levar o usuario ao ScheduleViewController.
        
    }
    
    @IBAction func goToInfoTapped(_ sender: Any) {
        
        // Essa action é responsavel por levar o usuario ao InfoPageViewController.
        
    }
    
    func manageTimer() {
        var nextDate = Date()
        UNUserNotificationCenter.current().getPendingNotificationRequests { (request) in
            nextDate = (request[0].trigger as! UNTimeIntervalNotificationTrigger).nextTriggerDate()!
        }
        
        self.timeRemaining += (nextDate.interval(ofComponent: .minute, fromDate: Date())*60)
        self.timeRemaining += nextDate.interval(ofComponent: .second, fromDate: Date())
        self.displayTime()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    func handleTimer() {
        self.timeRemaining -= 1
        self.displayTime()
    }
    
    func displayTime() {
        let minutes = Int(self.timeRemaining / 60)
        let seconds = self.timeRemaining % 60
        
        self.MinOutlet.text = "\(minutes)"
        self.SecOutlet.text = "\(seconds)"
    }
}

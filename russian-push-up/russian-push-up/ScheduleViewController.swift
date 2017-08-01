//
//  ScheduleViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 29/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    
    @IBOutlet weak var week1Outlet: UILabel!
    @IBOutlet weak var week2Outlet: UILabel!
    
    // w : week
    // d : day
    // so these outlets mean :
    // w1d1 = week1day1
    
    @IBOutlet weak var w1d1Outlet: UILabel!
    @IBOutlet weak var w1d2Outlet: UILabel!
    @IBOutlet weak var w1d3Outlet: UILabel!
    @IBOutlet weak var w1d4Outlet: UILabel!
    @IBOutlet weak var w1d5Outlet: UILabel!
    @IBOutlet weak var w1d6Outlet: UILabel!
    @IBOutlet weak var w1d7Outlet: UILabel!
    @IBOutlet weak var w2d1Outlet: UILabel!
    @IBOutlet weak var w2d2Outlet: UILabel!
    @IBOutlet weak var w2d3Outlet: UILabel!
    @IBOutlet weak var w2d4Outlet: UILabel!
    @IBOutlet weak var w2d5Outlet: UILabel!
    @IBOutlet weak var w2d6Outlet: UILabel!
    @IBOutlet weak var w2d7Outlet: UILabel!
    
    // these outlets should print out in the following manner : "xx push ups every yy minutes"
    
    @IBOutlet weak var w1d1ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d2ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d3ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d4ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d5ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d6ScheduleOutlet: UILabel!
    @IBOutlet weak var w1d7ScheduleOutlet: UILabel!
    
    @IBOutlet weak var w2d1ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d2ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d3ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d4ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d5ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d6ScheduleOutlet: UILabel!
    @IBOutlet weak var w2d7ScheduleOutlet: UILabel!
    

    override func viewDidLoad() {
        
        
        let vlad = Vladmir.sharedInstance
        
        week1Outlet.text = "1st Week"
        week2Outlet.text = "2nd Week"
        
        w1d1ScheduleOutlet.text = "\((Int(vlad.program[0].0 * Double(vlad.max)))) push ups every \(vlad.program[0].1) minutes"
        
        w1d2ScheduleOutlet.text = "\((Int(vlad.program[1].0 * Double(vlad.max)))) push ups every \(vlad.program[1].1) minutes"
        
        w1d3ScheduleOutlet.text = "\((Int(vlad.program[2].0 * Double(vlad.max)))) push ups every \(vlad.program[2].1) minutes"
        
        w1d4ScheduleOutlet.text = "\((Int(vlad.program[3].0 * Double(vlad.max)))) push ups every \(vlad.program[3].1) minutes"
        
        w1d5ScheduleOutlet.text = "\((Int(vlad.program[4].0 * Double(vlad.max)))) push ups every \(vlad.program[4].1) minutes"
        
        w1d6ScheduleOutlet.text = "\((Int(vlad.program[5].0 * Double(vlad.max)))) push ups every \(vlad.program[5].1) minutes"
        
        w1d7ScheduleOutlet.text = "\((Int(vlad.program[6].0 * Double(vlad.max)))) push ups every \(vlad.program[6].1) minutes"
        
        
        w2d1ScheduleOutlet.text = "\((Int(vlad.program[7].0 * Double(vlad.max)))) push ups every \(vlad.program[7].1) minutes"
        
        w2d2ScheduleOutlet.text = "\((Int(vlad.program[8].0 * Double(vlad.max)))) push ups every \(vlad.program[8].1) minutes"
        
        w2d3ScheduleOutlet.text = "\((Int(vlad.program[9].0 * Double(vlad.max)))) push ups every \(vlad.program[9].1) minutes"
        
        w2d4ScheduleOutlet.text = "\((Int(vlad.program[10].0 * Double(vlad.max)))) push ups every \(vlad.program[10].1) minutes"
        
        w2d5ScheduleOutlet.text = "\((Int(vlad.program[11].0 * Double(vlad.max)))) push ups every \(vlad.program[11].1) minutes"
        
        w2d6ScheduleOutlet.text = "\((Int(vlad.program[12].0 * Double(vlad.max)))) push ups every \(vlad.program[12].1) minutes"
        
        w2d7ScheduleOutlet.text = "\((Int(vlad.program[13].0 * Double(vlad.max)))) push ups every \(vlad.program[13].1) minutes"
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBackTapped(_ sender: Any) {
        
        // This action is responsible to return the user to the ViewController
        
    }

}

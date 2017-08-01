//
//  ScheduleViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 29/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
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

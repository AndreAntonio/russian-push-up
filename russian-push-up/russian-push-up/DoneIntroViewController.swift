//
//  DoneIntroViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 28/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class DoneIntroViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        @IBAction func doneButtonTapped(_ sender: Any) {
    
        var nextView : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = nextView
        
    }

}

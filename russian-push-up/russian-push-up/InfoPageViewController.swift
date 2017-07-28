//
//  InfoPageViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 28/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class InfoPageViewController: UIPageViewController {
    
    //var that can store result of functions
   // private(set) lazy var viewControllers : [UIViewController] = {
     //   return [
       //     self.myViewControllersFunc(_identifier: "FirstInfoViewController"),
         //   self.myViewControllersFunc(_identifier: "SecondInfoViewController"),
           // self.myViewControllersFunc(_identifier: "ThirdInfoViewController")
        //]
    //}()
    


    private func myViewControllersFunc(_identifier : String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: _identifier)
        
    }
    
    
    //first loaded func
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.dataSource = self

        // Do any additional setup after loading the view.
    }

}

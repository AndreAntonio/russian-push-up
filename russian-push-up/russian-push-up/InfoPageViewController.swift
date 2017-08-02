//
//  InfoPageViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 28/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class InfoPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set)lazy var orderedViewControllers : [UIViewController] = {
        return [self.newVc(viewController: "FirstInfoViewController"),
                self.newVc(viewController: "SecondInfoViewController"),
                self.newVc(viewController: "ThirdInfoViewController")
               ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let initial = orderedViewControllers.first {
            self.setViewControllers([initial], direction: .forward, animated: true, completion: nil)
        }
        //if let firstViewController = orderedViewControllers.first {
        //  setViewControllers([firstViewController],
        //                   direction: .forward,
        //                 animated: true,
        //               completion: nil)
        //}
    }
    
    // Do any additional setup after loading the view.
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    //returns previous view controller from current shown view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //get index of current view controller
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        //get index of previous view controller
        let previous = index-1
        guard previous >= 0 else {
            return nil
            //return orderedViewControllers.last
        }
        guard orderedViewControllers.count > previous else {
            return nil
        }
        return orderedViewControllers[previous]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //get index of current view controller
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        //get index of next vc
        let next = index + 1
        guard orderedViewControllers.count != next else {
            return nil
            //return orderedViewControllers.first
        }
        guard orderedViewControllers.count > next else {
            return nil
        }
        return orderedViewControllers[next]
    }
}

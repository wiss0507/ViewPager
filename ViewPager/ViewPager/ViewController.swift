//
//  ViewController.swift
//  ViewPager
//
//  Created by damingdan on 15/2/12.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

import UIKit
import UIViewPager

class ViewController: UIViewController, UIViewPagerDataSource, UIViewPagerDelegate {
    
    @IBOutlet weak var viewPager: UIViewPager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add child view controller
        var viewController1 = storyboard?.instantiateViewControllerWithIdentifier("ViewController1") as! UIViewController;
        var viewController2 = storyboard?.instantiateViewControllerWithIdentifier("ViewController2") as! UIViewController;
        var viewController3 = storyboard?.instantiateViewControllerWithIdentifier("ViewController3") as! UIViewController;
        addChildViewController(viewController1);
        addChildViewController(viewController2);
        addChildViewController(viewController3);
        
        self.viewPager.dataSouce = self;
        self.viewPager.delegate = self;
        self.viewPager.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItems(viewPager: UIViewPager) -> Int {
        return self.childViewControllers.count;
    }
    
    func controller(viewPager: UIViewPager, index: Int) -> UIViewController {
        return self.childViewControllers[index] as! UIViewController;
    }
    
    func titleForItem(viewPager: UIViewPager, index: Int) -> String {
        if let viewController = self.childViewControllers[index] as? UIViewController {
            if let title = viewController.title {
                return title;
            }
        }
        return "";
    }
}


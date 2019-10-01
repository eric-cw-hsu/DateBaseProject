//
//  CenterPageViewController.swift
//  Music Plus
//
//  Created by 劉品萱 on 2019/9/20.
//  Copyright © 2019 劉品萱. All rights reserved.
//

import Foundation
import UIKit

class CenterPageViewController: UIPageViewController {
    
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstPageViewController") as! FirstPageViewController, UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondPageViewController") as! SecondPageViewController, UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdPageViewController") as! ThirdPageViewController,UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourthPageViewController") as! FourthPageViewController,UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FifthPageViewController") as! FifthPageViewController
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        setViewControllerFromIndex(index: 0)
    }
    
    func setViewControllerFromIndex(index:Int)
    {
        self.setViewControllers([subViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
}


extension CenterPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if(currentIndex >= subViewControllers.count - 1){
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }


}

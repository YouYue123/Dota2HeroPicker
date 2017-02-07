//
//  TabbarViewControlller.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 6/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import UIKit
import SVProgressHUD

class TabBarViewController: UITabBarController {
    
    var viewModel: TabBarViewModel!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        self.viewModel = TabBarViewModel(notifyTabBarVC: handleTabBarViewModelNotification)
        self.tabBar.tintColor = UIColor.white
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    
}

extension TabBarViewController: UITabBarControllerDelegate {
    /* Method is called when the user selects a tab. It expects a return value that tells the TabBarViewController whether it should select that tab or not.
     */
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    /*
    */
}

//ViewModel -> ViewController Communication
extension TabBarViewController {
    func handleTabBarViewModelNotification(_ tarBarNotification: TabBarViewModelNotification){
        switch tarBarNotification {
            case .switchToHeroList :
                print("switchToHeroList")
            case .switchToHeroPicker:
                print("switchToHeroPicker")
        }
    }
}

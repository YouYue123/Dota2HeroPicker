//
//  TabBarViewModel.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 6/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation

enum TabBarViewModelNotification{
    case switchToHeroList
    case switchToHeroPicker
}

class TabBarViewModel: NSObject {
    
    fileprivate var notifyTabBarVC: ( (_ tabBarViewModelNotification: TabBarViewModelNotification) -> () )!
    
    init(notifyTabBarVC: @escaping (_ tabBarViewModelNotification: TabBarViewModelNotification) -> ()){
        super.init()
        self.notifyTabBarVC = notifyTabBarVC
    }
    

}

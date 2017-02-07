//
//  HeroListViewModel.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 7/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation


enum HeroListNotification {
    case reloadTableView
    case noSearchResult
}

class HeroListViewModel: NSObject {
    
    var notifyVC: ((_ heroListNotification: HeroListNotification) -> ())!
    
    //constant that defines the number of sections there are in the table view
    let kNumberOfSectionsInTableView = 2
    
    init(notifyVC: @escaping (_ heroListNotification: HeroListNotification) -> () ){
        
        super.init()
        self.notifyVC = notifyVC
        
    }
    
    func numberOfSections() -> Int {
        return kNumberOfSectionsInTableView
    }
    
}

//
//  HeroListViewModel.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 7/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation
import UIKit

enum HeroListNotification {
    case reloadTableView
    case getHeroListError
    case noSearchResult
}

class HeroListViewModel: NSObject {
    
    var heroList = [Hero]()
    
    var notifyVC: ((_ heroListNotification: HeroListNotification) -> ())!
    
    //constant that defines the number of sections there are in the table view
    let kNumberOfSectionsInTableView = 2
    
    init(notifyVC: @escaping (_ heroListNotification: HeroListNotification) -> () ){
        
        super.init()
        self.notifyVC = notifyVC
        
    }
    
    func subscribeHeroDataManagerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(HeroListViewModel.updateHeroListAndNotify), name: .heroListRefreshed , object: nil)
    }
    
    func unsubscribeHeroDataManagerNotifications() {
        NotificationCenter.default.removeObserver(self,name: .heroListRefreshed, object: nil)
    }
    
    func updateHeroListAndNotify(){
        self.heroList = HeroDataManager.SharedInstance.heroList
        self.notifyViewControllerToTriggerReloadTableView()
    }
    
}

//ViewController -> ViewModel Communication
extension HeroListViewModel {
    func numberOfSections() -> Int {
        return kNumberOfSectionsInTableView
    }
    func numberOfItemsInSections(_ section: Int) -> Int {
        return 1
    }
    func setupTableViewCell(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroListCell", for: indexPath) as? HeroListCell else {
            return UITableViewCell()
        }
        return cell
    }
}

//ViewModel -> ViewController Communication
extension HeroListViewModel {
    func notifyViewControllerToTriggerReloadTableView() {
        DispatchQueue.main.sync {
            self.notifyVC(HeroListNotification.reloadTableView)
        }
    }
    
    func notifyViewControllerGetHeroListError() {
        DispatchQueue.main.sync {
            self.notifyVC(HeroListNotification.getHeroListError)
        }
    }
    
    func notifyViewControllerToTriggetAlert() {
        DispatchQueue.main.sync {
            self.notifyVC(HeroListNotification.noSearchResult)
        }
    }
}

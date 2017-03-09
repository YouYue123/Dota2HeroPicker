//
//  HeroDataManager.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 7/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let getHeroListStarted = Notification.Name("GetHeroListStarted")
    static let heroListRefreshed = Notification.Name("HeroListRefreshed")
}

class HeroDataManager: NSObject {
    
    var heroList = [Hero]()
    
    fileprivate let kHeroListEndPoint = "heroList"
    
    static let SharedInstance: HeroDataManager = {
        var manager = HeroDataManager()
        return manager
    }()
    func getHeroList() -> [Hero] {
        let heroList = [Hero]()
        return heroList
    }
    func getServerBaseURL() -> String {
        
    }
}

extension HeroDataManager {
    func getHeroList() {
        NotificationCenter.default.post(name: .getHeroListStarted, object: nil)
        let requestURL = getAPIBaseRequestURL() + "/" + kHeroListEndPoint
        let request =
    }
}

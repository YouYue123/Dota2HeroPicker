//
//  Hero.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 6/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation
import SwiftyJSON

class Hero: NSObject {
    let name: String
    let winningRate: Float
    
    init?(_ response: Response?){
        
        if let json = Utils.convertResponseToDictionary(response),
            let name = json["name"] as? String,
            let winningRate = json["winningRate"] as? Float {
            
            self.name = name
            self.winningRate = winningRate
            
            super.init()
        } else{
            print(NSLocalizedString("Invalid User JSON", comment: ""))
            return nil
        }
        
    }
}

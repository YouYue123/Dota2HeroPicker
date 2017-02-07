//
//  Utilities.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 6/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation
import UIKit

class Utils: NSObject{
    
    class func convertStringToDictionary(_ text: String) -> [String : Any]? {
        if let data = text.data(using: String.Encoding.utf8){
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
                return json
            } catch{
                print(NSLocalizedString("Convert String To Dictionary Error", comment: ""))
            }
        }
        return nil
    }
    
    class func convertResponseToDictionary(_ response: Response?) -> [String : Any]? {
        if let resp = response {
            if let responseText = resp.responseText {
                return convertStringToDictionary(responseText)
            } else{
                return nil
            }
        } else{
            return nil
        }
    }
    class func nib(_ name: String) -> UINib? {
        let nib: UINib? = UINib(nibName: name, bundle: Bundle.main)
        return nib
    }
    class func registerNibWith(_ nibName: String, tableView: UITableView) {
        if let nib = Utils.nib(nibName) {
            tableView.register(nib, forCellReuseIdentifier: nibName)
        } else {
            print("nib not exits")
        }
    }
}

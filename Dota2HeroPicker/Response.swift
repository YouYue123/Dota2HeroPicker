//
//  Response.swift
//  Dota2HeroPicker
//
//  Created by YouYue on 6/2/17.
//  Copyright © 2017 YouYue. All rights reserved.
//

import Foundation

class Response{
    //MARK: Properties(API)
    public let statusCode: Int?
    public let headers: [AnyHashable: Any]?
    public let responseText: String?
    public let responseData: Data?
    public let isSuccessful: Bool
    //MARK: Properties(internal)
    internal let httpResponse: HTTPURLResponse?
    internal let isRedirect: Bool
    //MARK: Initializer
    public init(responseData: Data?, httpResponse: HTTPURLResponse?, isRedirect: Bool){
        
        self.isRedirect = isRedirect
        self.httpResponse = httpResponse
        self.headers = httpResponse?.allHeaderFields
        self.statusCode = httpResponse?.statusCode
        self.responseData = responseData
        
        if let responseData = responseData {
            self.responseText = String(data:responseData,encoding: .utf8)
        } else{
            self.responseText = nil
        }
        
        if let status = statusCode {
            self.isSuccessful = (200..<300 ~= status)
        } else{
            self.isSuccessful = false
        }
    }
}

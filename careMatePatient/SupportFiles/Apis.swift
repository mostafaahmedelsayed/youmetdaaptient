//
//  Apis.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//
import Alamofire
import Foundation
import SwiftyJSON
//import

struct AlamofireAppManager {
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
}


//callback: @escaping (AnyObject?)


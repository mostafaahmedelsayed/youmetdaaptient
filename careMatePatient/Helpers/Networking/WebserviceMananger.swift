//
//  WebserviceMananger.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class WebserviceMananger: NSObject {
    
    
    struct AlamofireAppManager {
        static let shared: SessionManager = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            configuration.timeoutIntervalForResource = 30
            let sessionManager = Alamofire.SessionManager(configuration: configuration)
            return sessionManager
        }()
    }
    struct Singleton {
        static let instance = WebserviceMananger()
     }
    
    
    class var sharedInstance: WebserviceMananger {
        return Singleton.instance
    }
    var callURL = ""
    
//    func makeCall(method: Alamofire.HTTPMethod, urlString : String, parameters: [String: Any]? , vc:UIViewController  , completionHandler : @escaping (AnyObject?,String?) -> ()) -> Void
//    {
//        
//        if Reachability.isConnectedToNetwork() {
//            callURL = urlString
//            var parss = parameters
//            
//            var url = urlString
//
//            Alamofire.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, method: method, parameters: parss, encoding: JSONEncoding.default, headers: nil).responseJSON
//                { response in
//                    
//                 let json = JSON(response.value)
//                    
//                    
//                    print(json)
//                    if response.response != nil && response.response?.statusCode == 200
//                    {
//                        
//                        completionHandler(json as AnyObject?, nil)
//
//                    }
//                    
//
//                    
//                    if response.response == nil || response.response!.statusCode == 500
//                    {
//                        indicator.sharedInstance.dismiss()
////                        Utilities.showAlert(vc, messageToDisplay: Languages.isArabic() ? "فشل في الاتصال " : "Couldn't connect to server")
//                        
//                        return
//                    }
//                    if response.response!.statusCode == 404
//                    {
//                        indicator.sharedInstance.dismiss()
//                        
////                        Utilities.showAlert(vc, messageToDisplay: Languages.isArabic() ? "فشل في الاتصال " : "Couldn't connect to server")
//                        return
//                    }
//                  
//
//        
//        else{
//            
//            indicator.sharedInstance.dismiss()
////            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
//        }
//    }
//        }
//}
}

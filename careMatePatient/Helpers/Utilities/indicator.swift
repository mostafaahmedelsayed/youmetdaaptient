//
//  indicator.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import SVProgressHUD
class indicator {
    
    
    struct Singleton {
        static let instance = indicator()
    }
    
    class var sharedInstance: indicator {
        return Singleton.instance
    }
    
    init() {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setDefaultMaskType(.clear)
        
        
        SVProgressHUD.setBackgroundColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        SVProgressHUD.setForegroundColor(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        
        //        Progress = JGProgressHUD(style: JGProgressHUDStyle.dark)
        //        Progress?.textLabel.text = "Loading.."
    }
    func show() {
        //        Progress?.show(in :vc.view)
        DimUtility.addDimView()
        
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func dismiss() {
        DimUtility.removeDimView()
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
        //        Progress?.dismiss()
    }
    
}

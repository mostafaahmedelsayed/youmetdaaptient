//
//  extensions.swift
//  careMatePatient
//
//  Created by khabeer on 4/1/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation


import UIKit
@IBDesignable
class RoundUIView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
extension UIView
{
    
    func setShadowLight()  {
        
        self.layer.shadowColor = #colorLiteral(red: 0.6616975665, green: 0.6618109941, blue: 0.6616826653, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 2
        
        
        
    }
}

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
        
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 2
        
        
        
    }
}
extension UIViewController {
   
    func GoToControllerWithIdentifier(identifier : String)
    {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func GoToHomeView()  {
        var window: UIWindow?

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homeVC") as UIViewController
                         
        window?.rootViewController = vc

    }
    
    func GoToOnBoardingView()  {
        let window = UIApplication.shared.delegate!.window
        let mainViewController = self.storyboard!.instantiateViewController(withIdentifier: "onBoardingVC")
        window!?.rootViewController = mainViewController
        window!?.makeKeyAndVisible()
    }
    func GoToOnLandingView()  {
        let window = UIApplication.shared.delegate!.window
        let mainViewController = self.storyboard!.instantiateViewController(withIdentifier: "LandingVC")
        window!?.rootViewController = mainViewController
        window!?.makeKeyAndVisible()
    }
    
    func GoToDeliveryView()  {
        let window = UIApplication.shared.delegate!.window
        let mainViewController = self.storyboard!.instantiateViewController(withIdentifier: "deliveryVC")
        window!?.rootViewController = mainViewController
        window!?.makeKeyAndVisible()
    }
//    func showMenu()  {
//        self.dismissKeyboard()
//        SideMenuManager.defaultManager.menuWidth = (Constants.ScreenWidth - 100); self.navigationController?.present(self.storyboard!.instantiateViewController(withIdentifier: Languages.isArabic() ? "sidemenutestar" : "sidemenutest"), animated: true, completion: nil)
//
//    }
    
    func GoToLoginView(nav : UINavigationController)  {
        let mainViewController = self.storyboard!.instantiateViewController(withIdentifier: "loginVC")
        nav.present(mainViewController, animated: true, completion: nil)
    }
    func delay(time: Double, closure:@escaping ()->()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+time, execute: {
            closure()
        })
        
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func handleLocalizationChange()
    {
        //        if Languages.currentAppleLanguage() == "ar"
        //        {
        //        loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: self.view.subviews)
        //        }
        UIView.appearance().semanticContentAttribute = Languages.currentAppleLanguage() == "en" ? .forceLeftToRight : .forceRightToLeft
    }
//    func loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: [UIView]) {
//        if subviews.count > 0 {
//            for subView in subviews {
//                if (subView is UIImageView) && subView.tag < 0 {
//                    let toRightArrow = subView as! UIImageView
//                    if let _img = toRightArrow.image {
//                        toRightArrow.image = UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImageOrientation.upMirrored)
//                    }
//
//                }
//                else if (subView is UIButton) && subView.tag < 0 {
//                    let toRightArrow = subView as! UIButton
//                    if let _img = toRightArrow.currentImage {
//                        toRightArrow.setImage(UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImageOrientation.upMirrored), for: .normal)
//                    }
//
//                }
//                loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: subView.subviews)
//            }
//        }
//    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
extension UIView
{
    
    
    func setGradient(view:UIView,firstColor:UIColor,secondeColor:UIColor,gradient:CAGradientLayer)   {
        gradient.frame = gradient.bounds
            
            
            
            view.layoutIfNeeded()
            view.backgroundColor = nil

            gradient.masksToBounds = false
            gradient.frame = view.bounds
            
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
            
            gradient.colors = [firstColor.cgColor,secondeColor.cgColor]
            gradient.cornerRadius = 20
    }
    
}

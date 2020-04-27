//
//  Login.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    var window: UIWindow?
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordUiview: RoundUIView!
    @IBOutlet weak var emailPhoneUiview: RoundUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailPhoneUiview.setShadowLight()
        passwordUiview.setShadowLight()
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        
        
        
        
        if  usernameTF.text != "" && passwordTF.text  != ""
        {
            
            
            let parameters = ["MobileNumber":usernameTF.text , "Password":passwordTF.text]
            
            UserModel.Login(vc: self, data: parameters) { (data) in
                if data == nil
                {
                    //                AwafyPhone = self.usernameTF.text!
                    self.performSegue(withIdentifier: "activateVC", sender: nil)
                }
                else
                {
                    self.dismiss(animated: true, completion: nil)
                    
                    guard let window = UIApplication.shared.keyWindow else { return }
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "gfhdhfh") as UIViewController
                    
                    window.rootViewController = vc
                    
                }
            }
            
            
        }
        else{
            Utilities.showAlert(self, messageToDisplay : Languages.isArabic() ? "ادخل كلمه السر والبريد الالكتروني" : "Plz Enter phone number and password")
            
        }
    }
    
}

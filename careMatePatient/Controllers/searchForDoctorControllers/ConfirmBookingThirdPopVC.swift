//
//  ConfirmBookingThirdPopVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/26/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
protocol ModalViewControllerDelegate:class {
    func dismissed()
}
class ConfirmBookingThirdPopVC: UIViewController {
    @IBOutlet weak var mainView: RoundUIView!
    
    
    @IBOutlet weak var usernameTF: UITextField!
     @IBOutlet weak var mobilePhoneTF: UITextField!
    var delegate:ModalViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

       @IBAction func back(_ sender: Any) {
        
        addOther()
           delegate?.dismissed()

       }
    
    
    
    func addOther()   {
          
      if  usernameTF.text != "" && mobilePhoneTF.text  != ""
      {
          
          
          let parameters = ["Name":usernameTF.text! , "Phone":mobilePhoneTF.text!]
          
        UserModel.addOtherPatient(vc: self, parameters: parameters) { (data) in
            
            
            
            
          }
          
          
      }
      else{
          Utilities.showAlert(self, messageToDisplay : Languages.isArabic() ? "ادخل كلمه السر والبريد الالكتروني" : "Plz Enter phone number and password")
          
      }
      }
   

}

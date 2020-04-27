//
//  HomeVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/21/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainViewMedication: UIView!

    @IBOutlet weak var mainView3: UIView!

    @IBOutlet weak var mainView2: UIView!
      @IBOutlet weak var mainViewMedication3: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
  


  
        mainView.setCorner(view: mainView)
        mainView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowRadius = 10
        
        mainViewMedication.setShadowLight()
        mainViewMedication.setCorner(view: mainViewMedication)
        
        
        mainView2.setShadowLight()
            mainView2.setCorner(view: mainView2)
        
        mainViewMedication3.setShadowLight()
            mainViewMedication3.setCorner(view: mainViewMedication3)

        mainView3.setShadowLight()
            mainView3.setCorner(view: mainView3)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchCliked() {
        
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIView
{
    
    
    func setCorner(view:UIView)  {
        
             view.layer.cornerRadius = 25
             view.layer.maskedCorners = [ .layerMinXMinYCorner,.layerMaxXMaxYCorner]
    }
    
}

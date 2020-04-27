//
//  ViewController1.swift
//  careMatePatient
//
//  Created by khabeer on 4/1/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

import MOLH

class ViewController1: UIViewController {

    
    @IBOutlet weak var mainView: UIView!
    
    let gradient1 = CAGradientLayer()


    @IBOutlet weak var mainView1: RoundUIView!
    
    
    @IBOutlet weak var mainView2: RoundUIView!
    @IBOutlet weak var mainView3: RoundUIView!
    @IBOutlet weak var mainView4: RoundUIView!


    let gradient2 = CAGradientLayer()
    let gradient3 = CAGradientLayer()
    let gradient4 = CAGradientLayer()

    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.tabBarController?.tabBar.isHidden = true
        mainView.setShadowLight()
    
              
                  mainView1.layer.insertSublayer(gradient1, at: 0)
     
        
        
        mainView1.setGradient(view: mainView1, firstColor: #colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1), secondeColor: #colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1), gradient: gradient1)
          
            mainView2.setGradient(view: mainView2, firstColor: #colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1), secondeColor: #colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1), gradient: gradient2)
            mainView3.setGradient(view: mainView3, firstColor: #colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1), secondeColor: #colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1), gradient: gradient3)
            mainView4.setGradient(view: mainView4, firstColor: #colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1), secondeColor: #colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1), gradient: gradient4)

        
    }
     
    @IBAction func changeLanguageCliked(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
    }
    
    @IBAction func complainsCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "complainsSearchDoctorVC") as? complainsSearchDoctorVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    @IBAction func locationCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "governmentListVC") as? governmentListVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func doctorSpacialityCliked(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "doctorSpecialityVC") as? doctorSpecialityVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func searchButtonCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "listOfSearchDoctorsVC") as? listOfSearchDoctorsVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
  
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

}







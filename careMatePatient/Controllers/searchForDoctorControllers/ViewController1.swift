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

    @IBOutlet weak var mainView: RoundUIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.tabBarController?.tabBar.isHidden = true
        mainView.setShadowLight()
        // Do any additional setup after loading the view.
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
        
        

        
        
//        let clvc = self.storyboard?.instantiateViewController(withIdentifier: "searchForDoctorHomeVC") as! searchForDoctorHomeVC
        //        self.navigationController?.pushViewController(clvc, animated: false)
        
        
//        self.present(clvc, animated: true, completion: nil)
        
//   self.navigationController?.pushViewController(clvc, animated: true)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

}

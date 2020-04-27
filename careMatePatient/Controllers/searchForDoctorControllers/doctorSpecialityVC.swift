//
//  doctorSpecialityVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import  BmoViewPager
class doctorSpecialityVC: UIViewController {
    var listOfStaticVCs = [UIViewController]()

    var doctorsSpecialityObject :doctorSpecialityModel?
    @IBOutlet weak var doctorLabel: UILabel!
    
    @IBOutlet weak var spacialityLinedView: UIView!
    @IBOutlet weak var spacialityImage: UIImageView!
    @IBOutlet weak var serachTextField: UITextField!

    
    @IBOutlet weak var mainView: UIView!
    let gradient = CAGradientLayer()

    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorLinedView: UIView!
    @IBOutlet weak var specailityLabel: UILabel!
    var tabName = [String]()
    @IBOutlet weak var mainViewPager: BmoViewPager!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        

                mainView.layoutIfNeeded()
        //        mainView1.backgroundColor = nil

                gradient.masksToBounds = false
                gradient.frame = mainView.bounds
                
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
                
                
                 gradient.cornerRadius = 20
        gradient.colors = [#colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.1180069521, green: 0.5047287941, blue: 0.7909183502, alpha: 1).cgColor,#colorLiteral(red: 0.1489492059, green: 0.6951314807, blue: 0.7378045917, alpha: 1).cgColor,#colorLiteral(red: 0.1791146994, green: 0.8544816375, blue: 0.6759428382, alpha: 1).cgColor]

                mainView.layer.insertSublayer(gradient, at: 0)
        
        let viewcontroller11 = storyboard!.instantiateViewController(withIdentifier: "SpecialityListVC")
        let viewcontroller22 = storyboard!.instantiateViewController(withIdentifier: "DoctorListVC")
       
        
        listOfStaticVCs.append(viewcontroller11)
        listOfStaticVCs.append(viewcontroller22)

        self.spacialityImage.image = UIImage(named: "speciality100Light")
        self.specailityLabel.alpha = 1
        self.spacialityLinedView.isHidden = false
        
        
        self.doctorImage.image = UIImage(named: "doctor50Light")
        
        self.doctorLabel.alpha = 0.5
        self.doctorLinedView.isHidden = true
        
        
        tabName.append("Spaicaility")
        tabName.append("Doctor")
     
        mainViewPager.delegate = self
        mainViewPager.dataSource = self
        mainViewPager.orientation = .horizontal
        // Do any additional setup after loading the view.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        loadDoctorSpeciality()
    }
   
    @IBAction func spacialityCliked(_ sender: Any) {
        
        mainViewPager.presentedPageIndex = 0
        
        mainViewPager.reloadData()
    }
    
    
    @IBAction func doctorCliked(_ sender: Any) {
        mainViewPager.presentedPageIndex = 1
        mainViewPager.reloadData()
        
        
    }

}

extension doctorSpecialityVC :BmoViewPagerDelegate,BmoViewPagerDataSource{
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 2
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        
        
        return listOfStaticVCs[page]
        
    }
    
    func bmoViewPagerDelegate(_ viewPager: BmoViewPager, didAppear viewController: UIViewController, page: Int) {
        
        
        if page == 0
            
        {
      
            
              let SpecialityListVC = storyboard!.instantiateViewController(withIdentifier: "SpecialityListVC") as? SpecialityListVC
            
            

            self.spacialityImage.image = UIImage(named: "speciality1")
            self.specailityLabel.alpha = 1
            self.spacialityLinedView.isHidden = false
            
            
            self.doctorImage.image = UIImage(named: "doctor0")
            
            self.doctorLabel.alpha = 0.5
            self.doctorLinedView.isHidden = true
            
            
        }
        if  page == 1
        {
            
           
            
            self.spacialityImage.image = UIImage(named: "speciality0")
            self.specailityLabel.alpha = 0.5
            self.spacialityLinedView.isHidden = true
        
            
            self.doctorImage.image = UIImage(named: "doctor1")
            
            self.doctorLabel.alpha = 1
            self.doctorLinedView.isHidden = false
            
        }
       
        
    }
    
    
    
}

extension doctorSpecialityVC
{
    
    
    func loadDoctorSpeciality()  {

        UserModel.loadDoctorsAndSpeciality(vc: self, SearchByKey: "") { (data) in
       self.doctorsSpecialityObject = nil

                           if let dataConstant = data
                           {
                               
                               self.doctorsSpecialityObject = dataConstant
                     
                           }
            
               
                       }

    }

    
    
}

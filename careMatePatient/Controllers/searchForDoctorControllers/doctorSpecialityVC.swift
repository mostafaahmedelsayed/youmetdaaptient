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

    @IBOutlet weak var doctorLabel: UILabel!
    
    @IBOutlet weak var spacialityLinedView: UIView!
    @IBOutlet weak var spacialityImage: UIImageView!
    
    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorLinedView: UIView!
    @IBOutlet weak var specailityLabel: UILabel!
    var tabName = [String]()
    @IBOutlet weak var mainViewPager: BmoViewPager!
    override func viewDidLoad() {
        super.viewDidLoad()

        
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

            self.spacialityImage.image = UIImage(named: "speciality100Light")
            self.specailityLabel.alpha = 1
            self.spacialityLinedView.isHidden = false
            
            
            self.doctorImage.image = UIImage(named: "doctor50Light")
            
            self.doctorLabel.alpha = 0.5
            self.doctorLinedView.isHidden = true
            
            
        }
        if  page == 1
        {
            self.spacialityImage.image = UIImage(named: "speciality50Light")
            self.specailityLabel.alpha = 0.5
            self.spacialityLinedView.isHidden = true
        
            
            self.doctorImage.image = UIImage(named: "doctor100Light")
            
            self.doctorLabel.alpha = 1
            self.doctorLinedView.isHidden = false
            
        }
       
        
    }
    
    
    
}

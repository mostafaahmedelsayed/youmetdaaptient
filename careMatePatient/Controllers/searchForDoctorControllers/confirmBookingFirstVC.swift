//
//  confirmBookingFirstVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/6/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import BmoViewPager
import Cosmos
import DropDown

class confirmBookingFirstVC: UIViewController {

    @IBOutlet weak var bookIngView: RoundUIView!
    @IBOutlet weak var patientName: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var SpecialtName: UILabel!
    
    @IBOutlet  weak var medicalInsuranceBtn: UIButton!
    var medicalInsurancDropDown = DropDown()

    
    var DoctorList : DoctorsListModel?


    var DoctorId = ""
    var arrayOfstrings = ["personal info","Clinic Photo","patient Rates"]
    
    var arrayOfcontrollers = [UIViewController]()
    @IBOutlet weak var bmopagerView: BmoViewPager!
    @IBOutlet weak var bmoNavigationPager: BmoViewPagerNavigationBar!
    @IBOutlet weak var mainView: RoundUIView!
    let gradient = CAGradientLayer()
    let gradient1 = CAGradientLayer()

    @IBOutlet weak var backGroundView: RoundUIView!
    
    
    @IBAction func bookCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmBookingSecondVC") as? ConfirmBookingSecondVC
        
        vc?.doctorData = self.DoctorList
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.setShadowLight()
        
        
        
        loadDoctorList(SearchByKey: "")
      
        
           bookIngView.layoutIfNeeded()
        //        mainView1.backgroundColor = nil

                gradient.masksToBounds = false
                gradient.frame = bookIngView.bounds
                
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                           gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
                
                
                 gradient.cornerRadius = 14
                gradient.colors = [#colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1).cgColor]

                bookIngView.layer.insertSublayer(gradient, at: 0)
        
        
        
        
                  backGroundView.layoutIfNeeded()
               //        mainView1.backgroundColor = nil

                       gradient1.masksToBounds = false
                       gradient1.frame = backGroundView.bounds
                       
                                gradient1.startPoint = CGPoint(x: 0.0, y: 0.0)
                                  gradient1.endPoint = CGPoint(x: 0.0, y: 1.0)
                       
                       
                        gradient1.cornerRadius = 14
                       gradient1.colors = [#colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.1842946708, green: 0.8338822126, blue: 0.6955732703, alpha: 1).cgColor,#colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1).cgColor]

                       backGroundView.layer.insertSublayer(gradient1, at: 0)
               

        
        let ConfirmBookingFirstVcFirst = storyboard!.instantiateViewController(withIdentifier: "ConfirmBookingFirstVcFirst")
        let ConfirmBookingFirstVcsecond = storyboard!.instantiateViewController(withIdentifier: "ConfirmBookingFirstVcseconde")
        let ComfirmBookingFirstVCthird = storyboard!.instantiateViewController(withIdentifier: "ComfirmBookingFirstVCthird")
        
        arrayOfcontrollers.append(ConfirmBookingFirstVcFirst)
        arrayOfcontrollers.append(ConfirmBookingFirstVcsecond)
        arrayOfcontrollers.append(ComfirmBookingFirstVCthird)
        
        bmopagerView.delegate = self
        bmopagerView.dataSource = self
        bmopagerView.orientation = .horizontal
        bmoNavigationPager.viewPager = bmopagerView
        
//        bmopagerView.presentedPageIndex = 0
        print(arrayOfcontrollers.count)
        bmopagerView.reloadData()
    }
    

   

}

extension confirmBookingFirstVC :BmoViewPagerDelegate,BmoViewPagerDataSource
{
    
    
    
    
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 3
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        
        
        return arrayOfcontrollers[page]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        return arrayOfstrings[page]
    }
      
    
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0)
        ]
    }
    
    
}




extension confirmBookingFirstVC
{

    func loadDoctorList(SearchByKey:String)  {

        UserModel.loadDoctorList(vc: self, param: ["DeviceType":1,"page":1,"Source":1,"DoctorId":self.DoctorId]) { (data) in
            
            
            self.DoctorList = data
            print(data.Doctors[0].DoctorSmallObject?.ArabicName)
            
            self.patientName.text = data.Doctors[0].DoctorSmallObject?.EnglishName
            
              self.SpecialtName.text = data.Doctors[0].DoctorSmallObject?.SpecialtNameEn

            
            if let rate = data.Doctors[0].DoctorSmallObject?.DoctorRate
            {
                
                self.rateView.rating = rate

            }

            
            
//
//                self.doctorsSpecialityObject = nil
//                self.doctorsSpecialityObject?.Specilaity = []
//
//                               if let dataConstant = data
//                               {
//
//                                self.doctorsSpecialityObject = dataConstant
//
//
//                                print(self.doctorsSpecialityObject?.Specilaity.count)
//
//                               }
//
//
//                self.spacialityListTableView.reloadData()
                                
            }

        }


}

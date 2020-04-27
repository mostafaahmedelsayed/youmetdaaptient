//
//  ConfirmBookingSecondVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/7/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import FSCalendar
import Cosmos

import DZNEmptyDataSet

import DropDown
class ConfirmBookingSecondVC: UIViewController {
    @IBOutlet weak var mainView: RoundUIView!
    
    var branchIdtogetAvailableSlot = ""
    
    var dateFromTotogetAvailableSlot = ""
    
    var listOfAvailableSlots = [AvailableDoctorSlots]()
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var medicalInsuranceLabel: UILabel!
    @IBOutlet  weak var medicalInsuranceBtn: UIButton!
    var medicalInsurancDropDown = DropDown()
    var branchesDropDown = DropDown()
    @IBOutlet  weak var branchesBtn: UIButton!

    
    @IBOutlet weak var bookIngView: RoundUIView!
    @IBOutlet weak var patientName: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var SpecialtName: UILabel!
    
    
    var paramters = [String:Any]()
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var appoinmentCollectionview: UICollectionView!
    
    @IBOutlet weak var priceUnitLabel: UILabel!
    @IBOutlet weak var prcieLabel: UILabel!
    @IBOutlet weak var IntervalOfConsultationLabel: UILabel!
    @IBOutlet weak var middleView: RoundUIView!
    
    @IBOutlet weak var IntervalOfConsultationUnit: UILabel!
    @IBOutlet weak var rateCount: UILabel!
    
    @IBOutlet weak var rateCountUnit: UILabel!
    var doctorData :DoctorsListModel?
    
    @IBAction func nextCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmBookingThirdVC") as? ConfirmBookingThirdVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setShadowLight()

        calender.scope = .week
        
        calender.delegate = self
        
        appoinmentCollectionview.delegate = self
        appoinmentCollectionview.dataSource = self
        
            self.appoinmentCollectionview.emptyDataSetSource = self
               self.appoinmentCollectionview.emptyDataSetDelegate = self
        
        
        middleView.setShadowLight()
        
        
        
        if (self.doctorData?.Doctors[0].DoctorClassess.count)! > 0
        
        {
            
            self.medicalInsuranceLabel.text = self.doctorData?.Doctors[0].DoctorClassess[0].EnglishName

        }
        else{
            
            self.medicalInsuranceLabel.text = "NotFound"

        }
        
        if (self.doctorData?.Doctors[0].Branches.count)! > 0
        {
            
            
            self.branchIdtogetAvailableSlot = self.doctorData?.Doctors[0].Branches[0].LicenceId ?? ""
            self.branchLabel.text = self.doctorData?.Doctors[0].Branches[0].BranchEnName
            
            
            print(self.doctorData?.Doctors[0].Branches[0].BranchEnName)
            print(self.doctorData?.Doctors[0].Branches[0].BranchId)

            

        }
        
        

        if let doctorDataNotOption = doctorData
        
        {
            rateCount.text = String(doctorDataNotOption.Doctors[0].DoctorSmallObject?.Ratecount ?? 0)

            prcieLabel.text = String(doctorDataNotOption.Doctors[0].DoctorSmallObject?.Price ?? 0.0)
            
            IntervalOfConsultationLabel.text = String(doctorDataNotOption.Doctors[0].DoctorSmallObject?.IntervalOfConsultation ?? 0)

            self.patientName.text = doctorDataNotOption.Doctors[0].DoctorSmallObject?.EnglishName
                       
                         self.SpecialtName.text = doctorDataNotOption.Doctors[0].DoctorSmallObject?.SpecialtNameEn

                       
                       if let rate = doctorDataNotOption.Doctors[0].DoctorSmallObject?.DoctorRate
                       {
                           
                           self.rateView.rating = rate

                       }

        }
        
        print("DoctorId")
        print(doctorData?.Doctors[0].DoctorSmallObject?.DoctorId)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let result = formatter.string(from: date)

        
        self.dateFromTotogetAvailableSlot = result
        

        paramters = ["DateTo":self.dateFromTotogetAvailableSlot,"DateFrom":self.dateFromTotogetAvailableSlot,"Source":1,"BranchId":self.branchIdtogetAvailableSlot,"DoctorId":doctorData?.Doctors[0].DoctorSmallObject?.DoctorId]
               
        
      print(paramters)
        
               self.loadDoctorAvailableSlots(Para: paramters)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
       
    }

  

}
extension ConfirmBookingSecondVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listOfAvailableSlots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell", for: indexPath) as! selectedComplainsCell
        
        
        
        cell.complainName.text = self.listOfAvailableSlots[indexPath.row].fromTime
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmBookingThirdVC") as? ConfirmBookingThirdVC
           
        vc?.branchID = self.branchIdtogetAvailableSlot
        vc?.doctorID = self.doctorData?.Doctors[0].DoctorSmallObject?.DoctorId ?? ""
        vc?.selectedData = self.dateFromTotogetAvailableSlot
        vc?.mobilePatient = self.doctorData?.Doctors[0].DoctorSmallObject?.MobileNumber  ?? ""
        vc?.selectedTime = self.listOfAvailableSlots[indexPath.row].fromTime
        vc?.ShiftId = self.listOfAvailableSlots[indexPath.row].ShiftId
        vc?.QueueNumber = self.listOfAvailableSlots[indexPath.row].QueueNumber
        vc?.TotalNetPayment = self.doctorData?.Doctors[0].DoctorSmallObject?.Price ?? 0.0
           self.navigationController?.pushViewController(vc!, animated: true)
           
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let screen = UIScreen.main.bounds

        let screenWidth = screen.size.width
        let screenHeight = screen.size.height
        var ll = "90:00 AM"
        
        
        
        return CGSize(width: screenWidth * 0.29, height: 45)
    }
    
    
    
}
extension ConfirmBookingSecondVC:FSCalendarDelegate
{
    
    
    @IBAction func medicalInsurance(_ sender: Any) {
         self.medicalInsurancDropDown.anchorView = medicalInsuranceBtn
         
      
        self.medicalInsurancDropDown.dataSource = (self.doctorData?.Doctors[0].DoctorClassess.map{$0.EnglishName})!
         self.medicalInsurancDropDown.selectionAction = { [unowned self] (index, item) in
              self.medicalInsuranceLabel.text = self.doctorData?.Doctors[0].DoctorClassess[index].EnglishName
         }
         self.medicalInsurancDropDown.show()
         
         
     }

    @IBAction func branches(_ sender: Any) {
          self.medicalInsurancDropDown.anchorView = medicalInsuranceBtn
          

        self.medicalInsurancDropDown.dataSource = (self.doctorData?.Doctors[0].Branches.map{$0.BranchEnName})!
          self.medicalInsurancDropDown.selectionAction = { [unowned self] (index, item) in
            self.branchLabel.text = self.doctorData?.Doctors[0].Branches[index].BranchEnName

            self.branchIdtogetAvailableSlot  = self.doctorData?.Doctors[0].Branches[index].LicenceId ?? ""
            
            
            self.branchIdtogetAvailableSlot = self.doctorData?.Doctors[0].Branches[index].LicenceId ?? ""

            self.paramters = ["DateTo":self.dateFromTotogetAvailableSlot,"DateFrom":self.dateFromTotogetAvailableSlot,"Source":1,"BranchId":self.branchIdtogetAvailableSlot,"DoctorId":self.doctorData?.Doctors[0].DoctorSmallObject?.DoctorId]
                
              
            print(self.paramters)
            self.loadDoctorAvailableSlots(Para: self.paramters)
          }
          self.medicalInsurancDropDown.show()
          
          
      }
    
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("KASKAS")
        print(date)
        
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd"
             
             let result = formatter.string(from: date)

        
        self.dateFromTotogetAvailableSlot = result

        paramters = ["DateTo":self.dateFromTotogetAvailableSlot,"DateFrom":self.dateFromTotogetAvailableSlot,"Source":1,"BranchId":self.branchIdtogetAvailableSlot,"DoctorId":doctorData?.Doctors[0].DoctorSmallObject?.DoctorId]
                    
                    self.loadDoctorAvailableSlots(Para: paramters)

    }

    func loadDoctorAvailableSlots(Para:[String:Any])  {
        
        UserModel.getDoctorAvailableSlots(vc: self, param: Para) { (data) in
            
       
            
            self.listOfAvailableSlots = data
            
            self.appoinmentCollectionview.reloadData()
            print(data)
        
            
          
        
    }
    
}
}

extension ConfirmBookingSecondVC: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    // ===============================================
    // ==== DZNEmptyDataSet Delegate & Datasource ====
    // ===============================================
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return self.listOfAvailableSlots.count == 0
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "error")
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView!) -> CAAnimation! {
        let animation = CABasicAnimation(keyPath: "transform")
        
        animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0.0, 0.0, 1.0))
        
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text =  "No Available Slots At This Time "
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor:UIColor.darkGray]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}

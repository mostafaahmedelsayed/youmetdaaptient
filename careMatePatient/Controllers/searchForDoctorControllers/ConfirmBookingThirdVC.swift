//
//  ConfirmBookingThirdVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/8/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class ConfirmBookingThirdVC: UIViewController {

    @IBOutlet weak var personsOtherCollectionViewList: UICollectionView!
    @IBOutlet weak var mainView: RoundUIView!
    
    var indexpathSelected = 0
    var branchID = ""
    var doctorID = ""
    
    var selectedData = ""
    
    
    var mobilePatient = ""
    
    var selectedTime = ""
    
    var QueueNumber = 0
    var ShiftId = 0
    
    var  TotalNetPayment = 0.0
    var VisitStatus = 0


    @IBOutlet weak var oldVisitBody: RoundUIView!
    @IBOutlet weak var newVisitBorder: RoundUIView!
    
    @IBOutlet weak var oldVisitBorder: RoundUIView!
    
    @IBOutlet weak var newVisitBody: RoundUIView!
    
    var listOfOthers = [otherPersonsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.setShadowLight()
        
    personsOtherCollectionViewList.delegate = self
        
        personsOtherCollectionViewList.dataSource = self
        
        personsOtherCollectionViewList.reloadData()
        self.newVisitBorder.layer.borderColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
        self.newVisitBody.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
        
        self.oldVisitBorder.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
             
             self.oldVisitBody.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        self.getOther()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func oldVisitCliked(_ sender: Any) {
        
        self.newVisitBorder.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.newVisitBody.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        self.oldVisitBorder.layer.borderColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
        
        self.oldVisitBody.backgroundColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)


    }
    
    @IBAction func RequestAppoiment(_ sender: Any) {
        
        
        var paramters = ["BranchId":self.branchID,"DoctorId":self.doctorID,"QueueNumber":self.QueueNumber,"RequestDate":self.selectedData,"ShiftId":self.ShiftId,"Slot":self.selectedTime,"TotalNetPayment":self.TotalNetPayment,"VisitStatus":0] as [String : Any]
        
        print(paramters)
        
        UserModel.RequestAppointment(vc: self, parameters: paramters) { (data) in
                
         
          self.listOfOthers = data
          self.personsOtherCollectionViewList.reloadData()
          
            
                
              
            
        }

        
        
    }
    @IBAction func newVisitCliked(_ sender: Any) {
        
        self.newVisitBorder.layer.borderColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
        self.newVisitBody.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
        
        self.oldVisitBorder.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
             
             self.oldVisitBody.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)


    }
}
extension ConfirmBookingThirdVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfOthers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherPersonConfirmCell",for: indexPath) as? OtherPersonConfirmCell
            
        cell?.personName.text = listOfOthers[indexPath.row].Name
        
        if self.indexpathSelected == indexPath.row
        {
            cell?.borderView.layer.borderColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)
            cell?.bodyView.backgroundColor = #colorLiteral(red: 0, green: 0.4934588075, blue: 0.8868863583, alpha: 1)

        }
        else{
            
            cell?.borderView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell?.bodyView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
        
        return cell!
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screen = UIScreen.main.bounds
            let screenWidth = screen.size.width
            let screenHeight = screen.size.height

                return CGSize(width: screenWidth * 0.5 , height: 100)
                
   
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexpathSelected = indexPath.row
        self.personsOtherCollectionViewList.reloadData()
    }
    
    
    
}

extension ConfirmBookingThirdVC
{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "ConfirmBookingThirdPopVC" {
              if let modalVC1 = segue.destination as? ConfirmBookingThirdPopVC {
                  modalVC1.delegate = self
              }
          }
      }
    func getOther()   {
        
           UserModel.getOtherswhoVisitPatinet(vc: self) { (data) in
                  
           
            self.listOfOthers = data
            self.personsOtherCollectionViewList.reloadData()
            
              
                  
                
              
          }
    }
  
    
}
extension ConfirmBookingThirdVC: ModalViewControllerDelegate {
   func dismissed() {
      dismiss(animated: true, completion: nil)//dismiss the presented view controller
   
    getOther()
   }
}

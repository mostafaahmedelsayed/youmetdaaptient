//
//  ConfirmBookingSecondVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/7/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import FSCalendar

class ConfirmBookingSecondVC: UIViewController {
    @IBOutlet weak var mainView: RoundUIView!
    
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var appoinmentCollectionview: UICollectionView!
    
    @IBOutlet weak var middleView: RoundUIView!
    
    
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
        
        middleView.setShadowLight()
        // Do any additional setup after loading the view.
    }
    

  

}
extension ConfirmBookingSecondVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell", for: indexPath) as! selectedComplainsCell
        
        
        
        cell.complainName.text = "90:00 AM"
        
        
        return cell
        
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
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("KASKAS")
        print(date)
        
        
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
//        dateFormatterGet.timeZone = NSTimeZone(name: "UTC") as! TimeZone
//
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
//        self.dateCurrent =   dateFormatterPrint.string(from: date)
//        let btn = UIBarButtonItem(title: self.dateCurrent, style: .plain, target: self, action: #selector(appearCalenderView))
//        btn.tintColor = #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1)
//        navigationItem.rightBarButtonItem = btn
//        self.loadRquestes(BranchId: self.governmentList[indexPathForSectors].id ?? 0, Url: URLSForPharmacy.getPendingRequests)
//
//
//        calenderFound = true
//
//        UIView.transition(with: self.calenderView,
//                          duration: 0.2,
//                          options: [.transitionFlipFromBottom],
//                          animations: {
//
//                            self.calenderView.isHidden = true
//                            self.calnderviewShadwo.isHidden = true
//
//        },
//                          completion: nil)
        
        //        self.requestCollectionView1.reloadData()
        
    }

    
    
}

//
//  confirmBookingFirstVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/6/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import BmoViewPager

class confirmBookingFirstVC: UIViewController {

    
    
    var arrayOfstrings = ["personal info","Clinic Photo","patient Rates"]
    
    var arrayOfcontrollers = [UIViewController]()
    @IBOutlet weak var bmopagerView: BmoViewPager!
    @IBOutlet weak var bmoNavigationPager: BmoViewPagerNavigationBar!
    @IBOutlet weak var mainView: RoundUIView!
    
    
    
    @IBAction func bookCliked(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmBookingSecondVC") as? ConfirmBookingSecondVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.setShadowLight()
        
      
        
        

        
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

//
//  ViewController.swift
//  careMatePatient
//
//  Created by khabeer on 4/1/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import BmoViewPager
class ViewController: UIViewController {

    @IBOutlet weak var searchDoctorImage: UIImageView!
    @IBOutlet var viewControllerViewPager: BmoViewPager!
    
    @IBOutlet weak var orderDruglineView: UIView!
    
    
    @IBOutlet weak var mainView: UIView!
    let gradient = CAGradientLayer()

    
    @IBOutlet weak var labRadViewLine: UIView!
    @IBOutlet weak var bookViewLine: UIView!
    @IBOutlet weak var searchViewLine: UIView!
    @IBOutlet weak var labRadImage: UIImageView!
    @IBOutlet weak var orderDrugsImage: UIImageView!
    @IBOutlet weak var bookClinicImage: UIImageView!
    @IBOutlet weak var viewPagerNavigation: BmoViewPagerNavigationBar!
    
    
    @IBOutlet weak var seacrhLabel: UILabel!
    
    @IBOutlet weak var bookLabel: UILabel!
        @IBOutlet weak var labRadLabel: UILabel!
    @IBOutlet weak var orderdrugsLabel: UILabel!
    var listOfStaticVCs = [UIViewController]()
    var tabName = [String]()

    
    @IBAction func searchCliked(_ sender: Any) {
        
        viewControllerViewPager.presentedPageIndex = 0
        
        viewControllerViewPager.reloadData()
    }
    
    
    @IBAction func bookCliked(_ sender: Any) {
        viewControllerViewPager.presentedPageIndex = 1
        viewControllerViewPager.reloadData()


    }
    
    @IBAction func orderDrugs(_ sender: Any) {
        viewControllerViewPager.presentedPageIndex = 2
        viewControllerViewPager.reloadData()


    }
    
    
    
    @IBAction func labradCliked(_ sender: Any) {
        viewControllerViewPager.presentedPageIndex = 3
        viewControllerViewPager.reloadData()


    }
   override func viewDidLayoutSubviews() {
     gradient.frame = self.view.bounds
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
//              gradient.frame = gradient.bounds
               gradient.cornerRadius = 20
              gradient.colors = [#colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1).cgColor]

              mainView.layer.insertSublayer(gradient, at: 0)

        
       let viewcontroller11 = storyboard!.instantiateViewController(withIdentifier: "ViewController1")
        let viewcontroller22 = storyboard!.instantiateViewController(withIdentifier: "ViewController2")
        let viewcontroller33 = storyboard!.instantiateViewController(withIdentifier: "ViewController3")
        let viewcontroller44 = storyboard!.instantiateViewController(withIdentifier: "ViewController4")

        listOfStaticVCs.append(viewcontroller11)
        listOfStaticVCs.append(viewcontroller22)
        listOfStaticVCs.append(viewcontroller33)
        listOfStaticVCs.append(viewcontroller44)

        
        
        tabName.append("serach")
        tabName.append("bookclinc")
        tabName.append("orderdrugs")

        tabName.append("orderdrugs")
        viewControllerViewPager.delegate = self
        viewControllerViewPager.dataSource = self
        viewControllerViewPager.orientation = .horizontal


    }


}


extension ViewController :BmoViewPagerDelegate,BmoViewPagerDataSource
{
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        
        return listOfStaticVCs.count
    }
    
    func bmoViewPagerDelegate(_ viewPager: BmoViewPager, didAppear viewController: UIViewController, page: Int) {
        
        
        if page == 0
            
        {
            
            
            self.seacrhLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.bookLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.orderdrugsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.labRadLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            
            self.searchDoctorImage.image = UIImage(named: "searchDoctor.png")
            self.bookClinicImage.image = UIImage(named: "cookClinic.png")
            
  

            
            searchViewLine.isHidden = false
            bookViewLine.isHidden = true
            orderDruglineView.isHidden = true
            labRadViewLine.isHidden = true
            
            
            searchViewLine.backgroundColor  = #colorLiteral(red: 0.9566063285, green: 0.4626916647, blue: 0.3773883581, alpha: 1)
            
            

            self.labRadImage.image = UIImage(named: "lapRad.png")
               self.orderDrugsImage.image = UIImage(named: "orderDrugs.png")
            
            
        }
        if  page == 1
        {
            self.seacrhLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.bookLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.orderdrugsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.labRadLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            
            
            
            searchViewLine.isHidden = true
            bookViewLine.isHidden = false
            orderDruglineView.isHidden = true
            labRadViewLine.isHidden = true
            
            
            bookViewLine.backgroundColor  = #colorLiteral(red: 0.9566063285, green: 0.4626916647, blue: 0.3773883581, alpha: 1)

            self.searchDoctorImage.image = UIImage(named: "searchDoctor50Light.png")

            self.bookClinicImage.image = UIImage(named: "bookClinic100light.png")

            
        
            
            self.labRadImage.image = UIImage(named: "lapRad.png")
             self.orderDrugsImage.image = UIImage(named: "orderDrugs.png")
            
        }
        if  page == 2
        {
            self.seacrhLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.bookLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.orderdrugsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.labRadLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            searchViewLine.isHidden = true
            bookViewLine.isHidden = true
            orderDruglineView.isHidden = false
            labRadViewLine.isHidden = true
            
            orderDruglineView.backgroundColor  = #colorLiteral(red: 0.9566063285, green: 0.4626916647, blue: 0.3773883581, alpha: 1)

            
            self.searchDoctorImage.image = UIImage(named: "searchDoctor50Light.png")
            
            self.bookClinicImage.image = UIImage(named: "cookClinic.png")
            self.labRadImage.image = UIImage(named: "lapRad.png")

            
               self.orderDrugsImage.image = UIImage(named: "orderdrugs100Light.png")
            
        }
        
        if  page == 3  {
            self.seacrhLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.bookLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.orderdrugsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.labRadLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            
            labRadViewLine.backgroundColor  = #colorLiteral(red: 0.9566063285, green: 0.4626916647, blue: 0.3773883581, alpha: 1)

            searchViewLine.isHidden = true
            bookViewLine.isHidden = true
            orderDruglineView.isHidden = true
            labRadViewLine.isHidden = false
            self.orderDrugsImage.image = UIImage(named: "orderDrugs.png")

            self.searchDoctorImage.image = UIImage(named: "searchDoctor50Light.png")
            
            self.bookClinicImage.image = UIImage(named: "cookClinic.png")
            self.labRadImage.image = UIImage(named: "lapRad100ligth.png")

            
        }
        
    }
 
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {




//        self.viewControllerViewPager.reloadData()

        return listOfStaticVCs[page]

    }
    
 
//    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
//        return [
//            NSAttributedString.Key.font :UIFont.systemFont(ofSize: 34, weight: UIFontWeightThin)
//,
//            NSAttributedString.Key.foregroundColor : UIColor.white
//        ]
//    }
//
  
    
}
extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor,view:UIView) {
        
       let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
       gradientLayer.colors = [colorOne.cgColor , colorTwo.cgColor]
       gradientLayer.locations = [0.0, 0.5, 1.0]
       gradientLayer.startPoint = CGPoint(x:0.5 , y:1.0)
       gradientLayer.endPoint = CGPoint(x:0.5 , y:0.0)
       layer.insertSublayer(gradientLayer, at: 0)
    }
}

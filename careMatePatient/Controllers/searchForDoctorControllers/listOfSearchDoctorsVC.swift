//
//  listOfSearchDoctorsVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/6/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class listOfSearchDoctorsVC: UIViewController {

    @IBOutlet weak var doctorsListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        doctorsListCollectionView.delegate = self
        doctorsListCollectionView.dataSource = self

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension listOfSearchDoctorsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == doctorsListCollectionView
        {
            return 5
        }
        else{
            
            return 10
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        
        if collectionView == doctorsListCollectionView
        {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchDoctorsListCell", for: indexPath) as! searchDoctorsListCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.mainView.setShadowLight()
            
            return cell
        }
        
        else{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell", for: indexPath) as! selectedComplainsCell
            
            
      
            return cell
            
        }
        
        
       
   
    }
 
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  collectionView ==  doctorsListCollectionView
        {
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "confirmBookingFirstVC") as? confirmBookingFirstVC
            
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let label = UILabel(frame: CGRect.zero)
        //        label.text = arraOfString[indexPath.row]
        //        label.sizeToFit()
        //        return CGSize(width: label.frame.width + 15.0, height: 45)
        let screen = UIScreen.main.bounds

        let screenWidth = screen.size.width
        let screenHeight = screen.size.height

        
        if collectionView == doctorsListCollectionView
        {
            return CGSize(width: screenWidth ,height: 250)

            
        }
        
        else{
            
            return CGSize(width: 65 ,height: 45)

        }
        

    }
    
    
}

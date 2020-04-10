//
//  ConfirmBookingFirstVcFirst.swift
//  careMatePatient
//
//  Created by khabeer on 4/7/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class ConfirmBookingFirstVcFirst: UIViewController {
    var selectedIndex = -1
    var tableviewIndexPath = 0
    var iscoolapcs =  false
    
    var calenderFound  = true
    @IBOutlet weak var doctorInfo: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        doctorInfo.dataSource = self
        doctorInfo.delegate =  self

        // Do any additional setup after loading the view.
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

extension ConfirmBookingFirstVcFirst:UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && self.iscoolapcs == true
        {
            var multi:CGFloat?
            
            
            multi = CGFloat(((5) * 150) + 60  )
            
            return multi!
            
        }
        else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorIfnoCell", for: indexPath) as? doctorIfnoCell
        
        //        self.tableviewIndexPath = indexPath.row
        
        cell?.view.setShadowLight()
        
        cell?.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableviewIndexPath = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
        if self.selectedIndex == indexPath.row
        {
            if self.iscoolapcs == true
            {
                self.iscoolapcs = false
            }
            else{
                self.iscoolapcs = true
                
            }
        }
        else{
            self.iscoolapcs = true
            
            
        }
        
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
extension ConfirmBookingFirstVcFirst:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        loadGetSalamtkPhr()
        
    return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        let screenHeight = screen.size.height
        
//
//        if collectionView == self.vitalsignCollectionview
//        {
//\\
        
        
        
        
            return CGSize(width: screenWidth * 0.8 , height: 150)
            
//        }
//        if self.tableviewIndexPath == 4
//        {
//
//            return CGSize(width: screenWidth, height: 350)
//        }
//        else{
//            return CGSize(width: screenWidth, height: 70.0)
//
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell",for: indexPath) as? selectedComplainsCell
            
        
        return cell!
        
    }
    
    
}


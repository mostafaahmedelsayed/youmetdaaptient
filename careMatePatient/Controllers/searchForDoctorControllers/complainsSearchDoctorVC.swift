//
//  searchForDoctorHomeVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/3/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit
import MOLH

class complainsSearchDoctorVC: UIViewController {

    @IBOutlet weak var complainsListTableView: UITableView!
    
var arraOfString = ["fefwefwefwefwefwef","wefjweoprjopejwrojwoqeroqwendnweqno;weqnr;nwernwe","fwefjnoewnfonewfnwenfknweqfnewknf","wijhifghfghfghfgdoef","fwekpfkepwkfpwqekqpkwpkf","mostafa"]
    @IBOutlet weak var selectedCompliansList: UICollectionView!
    @IBOutlet weak var mainView: RoundUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selectedCompliansList.delegate = self
        selectedCompliansList.dataSource = self
        
        complainsListTableView.dataSource = self
        complainsListTableView.delegate = self
        
        
        mainView.setShadowLight()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backCliked(_ sender: Any) {
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
        
      
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
extension complainsSearchDoctorVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return arraOfString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell", for: indexPath) as! selectedComplainsCell
        
        
    
            cell.complainName.text = arraOfString[indexPath.row]
   
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let label = UILabel(frame: CGRect.zero)
//        label.text = arraOfString[indexPath.row]
//        label.sizeToFit()
//        return CGSize(width: label.frame.width + 15.0, height: 45)
        
        
     
        
        return CGSize(width: arraOfString[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + 60, height: 50)
    }

    
}

extension complainsSearchDoctorVC :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        cell?.complainName.text =  "sdfsdf"
        
        return cell!
    }

}

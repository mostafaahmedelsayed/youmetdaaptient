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
    
    var arraOfString = ["df","fdf"]
    var listOfcomplains = [complainsSearchDoctorModel]()
    @IBOutlet weak var serachTextField: UITextField!
    @IBOutlet weak var mainView1: UIView!

    let gradient1 = CAGradientLayer()
    let gradient2 = CAGradientLayer()
    let gradient3 = CAGradientLayer()
    let gradient = CAGradientLayer()


    var indexFrom = 0
    var indexto = 30


    var parameters = ["indexFrom": 0 , "IndexTo":30 ,"serchKey":""] as [String : Any]
    
    var listOfcomplainsSelected = [complainsSearchDoctorModel]()

    @IBOutlet weak var selectedCompliansList: UICollectionView!
    @IBOutlet weak var mainView: RoundUIView!
    
    var  listOfSelectedItemsId = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.parameters = ["indexFrom": self.indexFrom , "IndexTo":self.indexto ,"serchKey":""] as [String : Any]
        
          serachTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        
        self.complainsListTableView.delegate = self
        self.complainsListTableView.dataSource = self

        selectedCompliansList.delegate = self
        selectedCompliansList.dataSource = self
 
        
        mainView1.layoutIfNeeded()
//        mainView1.backgroundColor = nil

        gradient.masksToBounds = false
        gradient.frame = mainView1.bounds
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                   gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        
         gradient.cornerRadius = 20
        gradient.colors = [#colorLiteral(red: 0.1691793799, green: 0.6415426135, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.4549744725, green: 0.7919399738, blue: 0.1380445957, alpha: 1).cgColor]

        mainView1.layer.insertSublayer(gradient, at: 0)
    }
//  override func viewDidLayoutSubviews() {
//      CATransaction.begin()
//      CATransaction.setDisableActions(true)
//      gradient.frame = self.view.bounds
//      CATransaction.commit()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadComplains(param: self.parameters)
    }
    @IBAction func backCliked(_ sender: Any) {
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
        
      
    }
 
}
extension complainsSearchDoctorVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        
        self.indexFrom = 0
        self.indexto = 30
        if  let searchText = self.serachTextField.text
        {
            
            self.listOfcomplains = []
             self.loadComplains(param: ["indexFrom": self.indexFrom , "IndexTo":self.indexto ,"serchKey":searchText] as [String : Any])
        }
            
       
      
        
        
        
    }
    
    @objc func removeFromSelected(sender: UIButton,indexpathRow:Int){
       
        print(self.listOfcomplainsSelected)
        print(self.listOfSelectedItemsId)

        
        
        if self.listOfSelectedItemsId.contains(self.listOfcomplainsSelected[sender.tag].id)
        
        {
            
                let indexOfA = listOfSelectedItemsId.index(of: self.listOfcomplainsSelected[sender.tag].id  )

               self.listOfcomplainsSelected.remove(at: indexOfA!)
                
                self.listOfSelectedItemsId.remove(at:indexOfA! )

        }
        else{
            
           self.listOfcomplainsSelected.append(self.listOfcomplains[sender.tag])
            self.listOfSelectedItemsId.append(self.listOfcomplains[sender.tag].id)

        }
       
       selectedCompliansList.semanticContentAttribute = .forceRightToLeft

       self.selectedCompliansList.reloadData()
       
       
       
        self.complainsListTableView.reloadData()
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.listOfcomplainsSelected.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedComplainsCell", for: indexPath) as! selectedComplainsCell
        
        
        cell.checkUncheck.tag = indexPath.row
        
        
        
           cell.checkUncheck.addTarget(self, action:#selector(removeFromSelected), for: .touchUpInside)
    
        cell.complainName.text = self.listOfcomplainsSelected[indexPath.row].EnglishName
   
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        
     
        
        return CGSize(width: self.listOfcomplainsSelected[indexPath.row].EnglishName.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + 60, height: 50)
    }

    
}

extension complainsSearchDoctorVC :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfcomplains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell

        
        
        
        if indexPath.row == listOfcomplains.count - 1 &&  self.indexto < listOfcomplains[indexPath.row].pages_count
        {
         
            print("pageCount")
            print(listOfcomplains[indexPath.row].pages_count)
            print(listOfcomplains[0].EnglishName)

            
            self.indexFrom = self.indexto + 1
            self.indexto += 30
            self.parameters = ["indexFrom": self.indexFrom , "IndexTo": self.indexto ,"serchKey":self.serachTextField.text ?? ""]
            loadComplains(param: parameters)
            
        }
        
    if MOLHLanguage.currentAppleLanguage() == "ar"
        
    {
     cell?.complainName.text =  self.listOfcomplains[indexPath.row].EnglishName
    }
     else{
    cell?.complainName.text =  self.listOfcomplains[indexPath.row].EnglishName

    
        }

        cell?.checkUnCheck.tag = indexPath.row
        
        cell?.checkUnCheck.addTarget(self, action:#selector(addToCard), for: .touchUpInside)
        
        
          if self.listOfSelectedItemsId.contains(self.listOfcomplains[indexPath.row].id)    {
                    cell?.checkUnCheckImage.image = UIImage(named: "CheakedComplain.png")

                }
                else
                {
                    
                    cell?.checkUnCheckImage.image = UIImage(named: "uncheackedCompalins.png")
                    
                }
        return cell!
    }
      
    @objc func addToCard(sender: UIButton,indexpathRow:Int){
        
     
         
         if self.listOfSelectedItemsId.contains(self.listOfcomplains[sender.tag].id)
         
         {
             
                 let indexOfA = listOfSelectedItemsId.index(of: self.listOfcomplains[sender.tag].id  )

                self.listOfcomplainsSelected.remove(at: indexOfA!)
                 
                 self.listOfSelectedItemsId.remove(at:indexOfA! )

         }
         else{
             
            self.listOfcomplainsSelected.append(self.listOfcomplains[sender.tag])
             self.listOfSelectedItemsId.append(self.listOfcomplains[sender.tag].id)

         }
        
//        selectedCompliansList.semanticContentAttribute = .forceRightToLeft

        self.selectedCompliansList.reloadData()
        
        
        
         self.complainsListTableView.reloadData()
     
     }

}

extension complainsSearchDoctorVC
{
      
    
    func loadComplains(param : [String:Any])  {
        
        
     print(self,param)
        
                UserModel.loadPatientComplains(vc: self, data: param) { (data) in
                 
                    
                    if let dataConstant = data
                    {
                        
                        self.listOfcomplains += dataConstant
                        
                       
                        print(self.listOfcomplains.count)
                        

                    }
                    self.complainsListTableView.delegate = self
                    self.complainsListTableView.dataSource = self
                                     
                    
                    self.complainsListTableView.reloadData()
                    
                    
                }

        
    }
    

    
    
}

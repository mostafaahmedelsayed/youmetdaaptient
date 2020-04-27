//
//  SpecialityListVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class SpecialityListVC: UIViewController {
    var doctorsSpecialityObject :doctorSpecialityModel?

    @IBOutlet weak var serachTextField: UITextField!

    @IBOutlet weak var spacialityListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        spacialityListTableView.delegate = self
        spacialityListTableView.dataSource = self

        serachTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        loadDoctorSpeciality(SearchByKey: "")
    }
}


extension SpecialityListVC :UITableViewDelegate,UITableViewDataSource
{
    
    
       @objc func textFieldDidChange(_ textField: UITextField) {
           
           self.doctorsSpecialityObject = nil

          
           if  let searchText = self.serachTextField.text
           {
               loadDoctorSpeciality(SearchByKey: searchText)

              
           }
               
          
         
           
           
           
       }
       
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctorsSpecialityObject?.Specilaity.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        cell?.complainName.text =  self.doctorsSpecialityObject?.Specilaity[indexPath.row].EnglishName
        
        if indexPath.row % 2 == 0
        {
            cell?.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
        else {
            cell?.contentView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
            
            
        }
        return cell!
    }
    
    
    
}
extension SpecialityListVC
{

    func loadDoctorSpeciality(SearchByKey:String)  {

            UserModel.loadDoctorsAndSpeciality(vc: self, SearchByKey: SearchByKey) { (data) in
           
                self.doctorsSpecialityObject = nil
                self.doctorsSpecialityObject?.Specilaity = []

                               if let dataConstant = data
                               {
                                   
                                self.doctorsSpecialityObject = dataConstant
                         
                                
                                print(self.doctorsSpecialityObject?.Specilaity.count)
                                
                               }
                

                self.spacialityListTableView.reloadData()
                                
            }

        }


}

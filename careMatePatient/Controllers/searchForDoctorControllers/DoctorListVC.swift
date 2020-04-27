//
//  DoctorListVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class DoctorListVC: UIViewController {
    @IBOutlet weak var doctorListTableView: UITableView!

    var doctorsSpecialityObject :doctorSpecialityModel?
    @IBOutlet weak var serachTextField: UITextField!

    var doctorList = [DoctorsearchModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(doctorList.count)

        doctorListTableView.delegate = self
        doctorListTableView.dataSource = self
        
        

        serachTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDoctorSpeciality(SearchByKey: "")
    }


}
extension DoctorListVC :UITableViewDelegate,UITableViewDataSource
{
    
    
       @objc func textFieldDidChange(_ textField: UITextField) {
           
        
        self.doctorsSpecialityObject = nil
        
           if  let searchText = self.serachTextField.text
           {
               loadDoctorSpeciality(SearchByKey: searchText)

              
           }

           
       }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "confirmBookingFirstVC") as? confirmBookingFirstVC
              
           vc?.DoctorId = self.doctorsSpecialityObject?.Doctors[indexPath.row].DoctorId ?? ""
              
              self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctorsSpecialityObject?.Doctors.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        cell?.complainName.text =  self.doctorsSpecialityObject?.Doctors[indexPath.row].EnglishName
        
        
        
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
extension DoctorListVC
{

    func loadDoctorSpeciality(SearchByKey:String)  {

            UserModel.loadDoctorsAndSpeciality(vc: self, SearchByKey: SearchByKey) { (data) in
                
                
                
                self.doctorsSpecialityObject = nil
           
                self.doctorsSpecialityObject?.Doctors = []
                               if let dataConstant = data
                               {
                                   
                                   self.doctorsSpecialityObject = dataConstant
                         print(self.doctorsSpecialityObject?.Doctors.count)

                               }
                
               
                
                self.doctorListTableView.reloadData()
                                
            }

        }

        
        
    

}

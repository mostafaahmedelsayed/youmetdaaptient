//
//  citiesOfGovernment.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class citiesOfGovernment: UIViewController {
    @IBOutlet weak var listOfGivernmentCities: UITableView!

    
    var listOfGovnmentCities = [governmentsModel]()
    
    var govId = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfGivernmentCities.delegate = self
        listOfGivernmentCities.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.loadCitiesRelatedTogov()
    }

   

}
extension citiesOfGovernment :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfGovnmentCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        //        cell?.complainName.text =  "sdfsdf"
        
        cell?.complainName.text = self.listOfGovnmentCities[indexPath.row].EnglishName
        
        return cell!
    }

}


extension citiesOfGovernment
{
    
    
    func loadCitiesRelatedTogov()  {

        UserModel.loadGovernmentCities(vc: self, GovId: self.govId) { (data) in
       
                           if let dataConstant = data
                           {
                               
                               self.listOfGovnmentCities = dataConstant
                     
                           }
                           self.listOfGivernmentCities.delegate = self
                           self.listOfGivernmentCities.dataSource = self
                                            
                           
                           self.listOfGivernmentCities.reloadData()
               
                       }

               
    }
    
}

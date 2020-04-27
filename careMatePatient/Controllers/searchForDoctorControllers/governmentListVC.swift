//
//  governmentListVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class governmentListVC: UIViewController {

    @IBOutlet weak var lastSelectedTableView: UITableView!
    
    var listOfGovernments = [governmentsModel]()
    @IBOutlet weak var governmentListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lastSelectedTableView.delegate = self
        lastSelectedTableView.dataSource = self
        
        
        governmentListTableView.delegate = self
        governmentListTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
 
  
    override func viewWillAppear(_ animated: Bool) {
        self.loadGovernment()
    }
    
    

}

extension governmentListVC :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfGovernments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
//        cell?.complainName.text =  "sdfsdf"
        
        cell?.complainName.text = self.listOfGovernments[indexPath.row].EnglishName
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.governmentListTableView
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "citiesOfGovernment") as? citiesOfGovernment

            
            vc?.govId = self.listOfGovernments[indexPath.row].id ?? 0
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
    
    
}


extension governmentListVC
{
    
    
    func loadGovernment()  {
        
        
        
                UserModel.loadGovernments(vc: self) { (data) in
                 
                    
                    if let dataConstant = data
                    {
                        
                        self.listOfGovernments = dataConstant
                        
                       
                        

                    }
                    self.governmentListTableView.delegate = self
                    self.governmentListTableView.dataSource = self
                                     
                    
                    self.governmentListTableView.reloadData()
                    
                    
                }

        
    }

    
}

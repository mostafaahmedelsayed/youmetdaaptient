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
    
    @IBOutlet weak var governmentListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lastSelectedTableView.delegate = self
        lastSelectedTableView.dataSource = self
        
        
        governmentListTableView.delegate = self
        governmentListTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
 
  
    
    
    

}

extension governmentListVC :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
//        cell?.complainName.text =  "sdfsdf"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.governmentListTableView
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "citiesOfGovernment") as? citiesOfGovernment
            
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
    
    
}

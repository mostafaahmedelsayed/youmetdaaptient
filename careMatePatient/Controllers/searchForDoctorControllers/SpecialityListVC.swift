//
//  SpecialityListVC.swift
//  careMatePatient
//
//  Created by khabeer on 4/5/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class SpecialityListVC: UIViewController {

    @IBOutlet weak var spacialityListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        spacialityListTableView.delegate = self
        spacialityListTableView.dataSource = self

        
        // Do any additional setup after loading the view.
    }
    

   
}
extension SpecialityListVC :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        //        cell?.complainName.text =  "sdfsdf"
        
        if indexPath.row % 2 == 0
        {
            cell?.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
        else {
            cell?.contentView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            
            
        }
        return cell!
    }
    
    
    
}

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

    override func viewDidLoad() {
        super.viewDidLoad()

        listOfGivernmentCities.delegate = self
        listOfGivernmentCities.dataSource = self
        // Do any additional setup after loading the view.
    }
    

   

}
extension citiesOfGovernment :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compliansCell", for: indexPath) as? compliansCell
        //        cell?.complainName.text =  "sdfsdf"
        
        return cell!
    }

}

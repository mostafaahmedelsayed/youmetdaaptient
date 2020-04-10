//
//  searchDoctorsListCell.swift
//  careMatePatient
//
//  Created by khabeer on 4/6/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class searchDoctorsListCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setNeedsDisplay()
        collectionView.reloadData()
        
    }

}

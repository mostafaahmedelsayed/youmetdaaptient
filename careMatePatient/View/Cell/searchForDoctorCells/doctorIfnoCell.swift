//
//  doctorIfnoCell.swift
//  careMatePatient
//
//  Created by khabeer on 4/7/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class doctorIfnoCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    
    
    @IBOutlet weak var view: UIView!
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setNeedsDisplay()
        collectionView.reloadData()
        
    }

}

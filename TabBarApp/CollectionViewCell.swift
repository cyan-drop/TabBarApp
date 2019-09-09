//
//  CollectionViewCell.swift
//  TabBarApp
//
//  Created by 泉 on 2018/10/22.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 5.0
    }
    
    
}

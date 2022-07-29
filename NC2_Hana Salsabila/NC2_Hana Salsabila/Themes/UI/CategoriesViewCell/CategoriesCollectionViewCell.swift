//
//  CategoriesCollectionViewCell.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 20/07/22.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

//    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryLabel.sizeToFit()
        layer.cornerRadius = 10
        
        if isSelected {
            backgroundColor = UIColor.darkRed
        } else {
//            backgroundColor = UIColor.gray
        }
//        categoryLabel.contentEdgeInsets = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 10)
    }

}


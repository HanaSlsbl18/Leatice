//
//  AddCategoryCollectionViewCell.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 28/07/22.
//

import UIKit

class AddCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryLabel.sizeToFit()
        layer.cornerRadius = 10

        if isSelected {
            categoryLabel.textColor = .white
            backgroundColor = .darkRed
//            deletBtn.tintColor = .white
        } else {
            categoryLabel.textColor = .black
//            backgroundColor = .gray
//            deletBtn.tintColor = .darkRed
        }
        
    }
    
    
//    @IBAction func deleteClicked(_ sender: UIButton) {
//        
//        let newCategory = Categories(context: self.context)
//        
//        newCategory.name =
//        
//        
//        // Delete the entity from the context
//        context.delete(user)
//
//        // To delete the entity from the persistent store, call
//        // save on the context
//        do {
//            try context.save()
//        }
//        catch {
//            // Handle Error
//        }
//        
//        //Re-fetch the data
//        self.fetchCategories()
//        
//    }
    
}

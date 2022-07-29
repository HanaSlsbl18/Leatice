//
//  CourseCollectionViewCell.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 22/07/22.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var countCourseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        progressView.tintColor = .darkBlue
        self.backgroundColor = .white
        
        
    }

}

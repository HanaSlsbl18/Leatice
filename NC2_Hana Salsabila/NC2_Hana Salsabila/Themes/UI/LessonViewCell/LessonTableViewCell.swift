//
//  LessonTableViewCell.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 22/07/22.
//

import UIKit

class LessonTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        layer.cornerRadius = 10
    }
    
}

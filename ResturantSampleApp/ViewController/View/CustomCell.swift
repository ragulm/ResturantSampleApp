//
//  CustomCell.swift
//  ResturantSampleApp
//
//  Created by M L Ragul on 10/04/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var imgViewHolder: UIImageView!
    @IBOutlet weak var lblNameVal: UILabel!
    @IBOutlet weak var lblAvailability: UILabel!
    @IBOutlet weak var lblFacitities: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

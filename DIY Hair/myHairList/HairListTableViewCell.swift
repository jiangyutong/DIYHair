//
//  HairListTableViewCell.swift
//  DIY Hair
//
//  Created by jiang on 2018/12/4.
//  Copyright © 2018年 blueGrey. All rights reserved.
//

import UIKit

class HairListTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

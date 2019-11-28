//
//  ClothesTableViewCell.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 28/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var NameText: UILabel!
    @IBOutlet weak var detailsText: UITextView!
    @IBOutlet weak var contectText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  OtherTableViewCell.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 28/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

    @IBOutlet weak var detailstxt: UITextView!
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var NameText: UILabel!
    @IBOutlet weak var pricetext: UILabel!
    @IBOutlet weak var contacttxt: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

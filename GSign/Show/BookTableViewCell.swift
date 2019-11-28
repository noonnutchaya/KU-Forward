//
//  BookTableViewCell.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 28/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var contactText: UILabel!
    @IBOutlet weak var detailsText: UITextView!
    @IBOutlet weak var NameText: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

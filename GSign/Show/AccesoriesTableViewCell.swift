//
//  AccesoriesTableViewCell.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 28/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit

class AccesoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var NameText: UILabel!
    @IBOutlet weak var contactView: UILabel!
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var TextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

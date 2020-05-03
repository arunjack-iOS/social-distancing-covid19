//
//  PassDetailNameCell.swift
//  SocialDistancing
//
//  Created by Mohan Babu on 02/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class PassDetailNameCell: UITableViewCell {
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var passIdLbl: UILabel!
    @IBOutlet weak var tickImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameView.layer.cornerRadius = 10
        tickImage.layer.cornerRadius = 6
       // displayUIData()
    }

    func displayUIData(_ pass: PassEntity?) {
        nameLbl.text = pass?.name
        phoneLbl.text =  pass?.phone
        cityLbl.text = pass?.address
        passIdLbl.text = pass?.pincode
    }

}

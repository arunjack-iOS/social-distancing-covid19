//
//  PassDetailPurposeCell.swift
//  SocialDistancing
//
//  Created by Mohan Babu on 02/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class PassDetailPurposeCell: UITableViewCell {
    
    @IBOutlet weak var purposeView: UIView!
    @IBOutlet weak var purposeLbl: UILabel!
    @IBOutlet weak var groceryLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        purposeView.layer.cornerRadius = 10
        displayUIData()
    }

    func displayUIData() {
        purposeLbl.text = "Purpose"
        groceryLbl.text = "Fruits"
        timeLbl.text = "Today 3 May 1 PM to 2 PM"
    }
}

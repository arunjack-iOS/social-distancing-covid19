//
//  PassCell.swift
//  SocialDistancing
//
//  Created by Arun Jack on 01/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class PassCell: UITableViewCell {

    @IBOutlet weak var purposeLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var slotLbl: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        baseView.layer.cornerRadius = 8.0
        baseView.clipsToBounds = true
        
    }

    func configurePassCell(_ passData: PassEntity) {
        self.purposeLbl.text = passData.purpose
        self.statusLbl.text = passData.status
        self.slotLbl.text = passData.slot
        
        let statusColor: UIColor = PassStatus(rawValue: passData.status)?.getColor() ?? UIColor.black
        statusLbl.textColor = statusColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

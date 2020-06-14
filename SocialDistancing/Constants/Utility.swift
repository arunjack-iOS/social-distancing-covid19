//
//  Utility.swift
//  SocialDistancing
//
//  Created by SUNDEEP MANNE on 11/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import Foundation
import UIKit

func configureUI(for textfield: UITextField) {
    textfield.layer.borderWidth = textFieldContants.borderWidth
    textfield.layer.borderColor = ColorConstants.color4981DB.cgColor
    textfield.layer.cornerRadius = textFieldContants.cornerRadius
    textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
    textfield.leftViewMode = UITextField.ViewMode.always
}

//
//  UIViewControllerExtension.swift
//  SocialDistancing
//
//  Created by Nandish Babu on 5/2/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

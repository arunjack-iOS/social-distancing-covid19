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
    
    func showAlert(title: String, message: String, handlerAction: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handlerAction))
        self.present(alert, animated: true)
    }
}

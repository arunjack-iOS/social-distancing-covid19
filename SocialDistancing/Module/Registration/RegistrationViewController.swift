//
//  RegistrationViewController.swift
//  SocialDistancing
//
//  Created by SUNDEEP MANNE on 11/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var picodeTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = StringConstants.registrationNavBarTitle
        configureTextFieldUI()
        nameTextField.becomeFirstResponder()
    }
    
    fileprivate func configureTextFieldUI() {
        configureUI(for: nameTextField)
        configureUI(for: phoneTextField)
        configureUI(for: addressTextField)
        configureUI(for: picodeTextField)
        configureUI(for: otpTextField)
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        view.endEditing(true)
        self.navigationController?.show(DashboardWireFrame.assembleDashboard(), sender: nil)
    }
}

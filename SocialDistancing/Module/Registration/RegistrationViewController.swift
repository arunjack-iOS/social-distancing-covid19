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
        saveRegistrationDetails()
        let dashNav = DashboardWireFrame.assembleDashboard()
        self.navigationController?.pushViewController(dashNav.viewControllers[0], animated: true)
    }
    
    fileprivate func saveRegistrationDetails() {
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "userName")
        defaults.set(phoneTextField.text, forKey: "phoneNumber")
        defaults.set(addressTextField.text, forKey: "address")
        defaults.set(picodeTextField.text, forKey: "pinCode")
        defaults.set(otpTextField.text, forKey: "otp")
        defaults.set(true, forKey: "islogin")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

class RegWireFrame {
    
    class func assembleReg() -> UIViewController {
        let storyboard = UIStoryboard(name:"Registration",bundle: Bundle.main)
        guard let dashNav = storyboard.instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationViewController else {
            fatalError("Invalid view controller type")
        }
        return dashNav
    }
}

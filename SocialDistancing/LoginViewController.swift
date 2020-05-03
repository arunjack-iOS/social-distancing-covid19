//
//  LoginViewController.swift
//  SocialDistancing
//
//  Created by Arun Jack on 27/04/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldUI()
        fetchCredentials()
    }
    
    func textFieldUI() {
                
        let borderColor = UIColor(red: 0.03, green: 0.37, blue: 0.99, alpha: 1.0)
        let phonePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.phoneTextField.frame.height))
        let otpPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.phoneTextField.frame.height))
        
        phoneTextField.layer.borderWidth = 1.0
        phoneTextField.layer.borderColor = borderColor.cgColor
        phoneTextField.layer.cornerRadius = 5.0
        phoneTextField.leftView = phonePaddingView
        phoneTextField.leftViewMode = UITextField.ViewMode.always
        phoneTextField.delegate = self
        
        otpTextField.layer.borderWidth = 1.0
        otpTextField.layer.borderColor = borderColor.cgColor
        otpTextField.layer.cornerRadius = 5.0
        otpTextField.leftView = otpPaddingView
        otpTextField.leftViewMode = UITextField.ViewMode.always
        otpTextField.delegate = self
        
    }
    
    func fetchCredentials() {
        guard let username = UserDefaults.standard.value(forKey: "username"), let otp = UserDefaults.standard.value(forKey: "otp") else { return }
        phoneTextField.text = username as? String
        otpTextField.text = otp as? String
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        if phoneTextField.text == "testuser" && otpTextField.text == "1234" {
            showAlert(title: "", message: "Login Success")
        } else {
            showAlert(title: "Error", message: "Please enter Valid credentials")
        }
    }
    
    @IBAction func createAccountBtnClicked(_ sender: Any) {
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        return true
    }
    
}

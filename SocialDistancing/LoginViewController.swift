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
        configureUI(for: phoneTextField)
        configureUI(for: otpTextField)
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

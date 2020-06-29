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
        textFieldUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCredentials()
    }
    
    func textFieldUI() {
        configureUI(for: phoneTextField)
        configureUI(for: otpTextField)
    }
    
    func fetchCredentials() {
        guard let username = UserDefaults.standard.value(forKey: "userName"), let otp = UserDefaults.standard.value(forKey: "otp") else { return }
        phoneTextField.text = username as? String
        otpTextField.text = otp as? String
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard phoneTextField.text == UserDefaults.standard.value(forKey: "userName") as? String, otpTextField.text == UserDefaults.standard.value(forKey: "otp") as? String else {
            showAlert(title: "Error", message: "Please enter Valid credentials", handlerAction: {(action) in })
            return
        }
        pushToDashboard()
    }
    
    func pushToDashboard() {
        UserDefaults.standard.set(true, forKey: "islogin")
        let dashNav = DashboardWireFrame.assembleDashboard()
        self.navigationController?.pushViewController(dashNav.viewControllers[0], animated: false)
        
    }
    @IBAction func createAccountBtnClicked(_ sender: Any) {
       let regVC = RegWireFrame.assembleReg()
       self.navigationController?.pushViewController(regVC, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class LoginWireFrame {
    
    class func assembleLogin() -> UINavigationController {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        guard let dashNav = storyboard.instantiateViewController(withIdentifier: "LoginNav") as? UINavigationController else {
            fatalError("Invalid view controller type")
        }
        return dashNav
    }
}

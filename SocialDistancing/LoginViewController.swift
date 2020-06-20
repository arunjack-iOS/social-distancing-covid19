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
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "islogin") {
            pushToDashboard()
        }
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
          //  showAlert(title: "", message: "Login Success")
            saveCredentials()
            pushToDashboard()
        } else {
            UserDefaults.standard.set(false, forKey: "islogin")

            showAlert(title: "Error", message: "Please enter Valid credentials", handlerAction: {(action) in })
        }
    }
    
    func saveCredentials() {
        UserDefaults.standard.set(true, forKey: "islogin")
           UserDefaults.standard.setValue("testuser", forKey: "username")
           UserDefaults.standard.setValue("1234", forKey: "otp")
       }
    
    func pushToDashboard() {
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
        //self.view.endEditing(true)
        return true
    }
    
}

class LoginWireFrame {
    
    class func assembleDashboard() -> UINavigationController {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)

        guard let dashNav = storyboard.instantiateViewController(withIdentifier: "LoginNav") as? UINavigationController else {
            fatalError("Invalid view controller type")
        }
        return dashNav
    }
}

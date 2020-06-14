//
//  RequestPassViewController.swift
//  SocialDistancing
//
//  Created by Virendra Kumar on 07/06/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import Foundation
import UIKit

class RequestPassViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet var timeSlotPicker : UIPickerView!
    @IBOutlet weak var purposeTextField : UITextField!
    @IBOutlet weak var timeTextField1 : UITextField!
    @IBOutlet weak var timeTextField2 : UITextField!
    var timeSlot1Data: [String] = [String]()
    var timeSlot2Data: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timeSlotPicker = UIPickerView()
        timeSlotPicker.dataSource = self
        timeSlotPicker.delegate = self
        timeTextField1.delegate = self
        timeTextField2.delegate = self
        
        self.title = "Request Pass"
        timeSlot1Data = ["Today", "Tommorow"]
        timeSlot2Data = ["8AM to 9AM", "9AM to 10AM","10AM to 11AM","11AM to 12PM","12PM to 1PM","1PM to 2PM","2PM to 3PM","3PM to 4PM","4PM to 5PM","5PM to 6PM","6PM to 7PM","7PM to 8PM"]
        configureTextFieldUI()
        purposeTextField?.becomeFirstResponder()
        
        timeTextField1.inputView = timeSlotPicker
        timeTextField2.inputView = timeSlotPicker

        //It is important that goes after de inputView assignation
        self.timeSlotPicker = timeSlotPicker
    }
    
    fileprivate func configureTextFieldUI() {
        configureUI(for: purposeTextField)
        configureUI(for: timeTextField1)
        configureUI(for: timeTextField2)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       timeSlotPicker.reloadAllComponents()
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if timeTextField1.isFirstResponder {
            return timeSlot1Data.count
        } else if timeTextField2.isFirstResponder {
            return timeSlot2Data.count
        }
            return 0
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if timeTextField1.isFirstResponder {
            return timeSlot1Data[row]
        } else if timeTextField2.isFirstResponder {
            return timeSlot2Data[row]
        }
            return nil
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if timeTextField1.isFirstResponder {
            timeTextField1?.text = timeSlot1Data[row]
        } else if timeTextField2.isFirstResponder  {
            timeTextField2?.text = timeSlot2Data[row]
        }
    }
    
    @IBAction func submitBtnClick(_sender : Any) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        if let text1 = timeTextField1.text, let text2 = timeTextField2.text {
            let result = formatter.string(from: date)
            print(text1 + " " + result + " " + text2)
        }
        showAlert(title: "Thanks You", message: "You will be notified once your pass status updated.")
    }
}

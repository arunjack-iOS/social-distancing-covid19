//
//  RequestPassViewController.swift
//  SocialDistancing
//
//  Created by Virendra Kumar on 07/06/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import Foundation
import UIKit

class RequestPassViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var purposePicker : UIPickerView?
    @IBOutlet var purposeTextField : UITextField?
    @IBOutlet var timeTextField : UITextField?
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.purposePicker?.dataSource = self
        self.purposePicker?.delegate = self
        self.title = "Request Pass"
        pickerData = ["Grocery", "Medical", "Vegetable", "Emergency"]
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        purposeTextField?.text = pickerData[row]
    }
    
    @IBAction func submitBtnClick(_sender : Any) {
        showAlert(title: "Thanks You", message: "You will be notified once your pass status updated.")
    }
}

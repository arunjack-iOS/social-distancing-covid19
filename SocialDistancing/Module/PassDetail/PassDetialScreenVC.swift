//
//  PassDetialScreenVC.swift
//  SocialDistancing
//
//  Created by Mohan Babu on 02/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

class PassDetialScreenVC: UIViewController {
    
    @IBOutlet weak var passDetialTableView: UITableView!
    @IBOutlet weak var cancelPassBtn: UIButton!
    var passDataModel: PassEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelPassBtn.layer.cornerRadius = 10
        self.navigationItem.title = "Pass Details"
        self.navigationItem.hidesBackButton = false
        passDetialTableView.tableFooterView = UIView()
        passDetialTableView.estimatedRowHeight = 150
        passDetialTableView.rowHeight = UITableView.automaticDimension

    }
    
    @IBAction func cancelPassAction(_ sender: Any) {
        
    }
    


}

extension PassDetialScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PassDetailNameCell", for: indexPath) as? PassDetailNameCell {
                cell.displayUIData(passDataModel)
            return cell
            }
        }

        if let cell = tableView.dequeueReusableCell(withIdentifier: "PassDetailPurposeCell", for: indexPath) as? PassDetailPurposeCell {
            cell.displayUIData(passDataModel)
            return cell
            
            }
        
               return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


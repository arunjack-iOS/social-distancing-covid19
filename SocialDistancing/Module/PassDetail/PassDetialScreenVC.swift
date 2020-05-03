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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelPassBtn.layer.cornerRadius = 10
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
            return cell
            }
        }

        if let cell = tableView.dequeueReusableCell(withIdentifier: "PassDetailPurposeCell", for: indexPath) as? PassDetailPurposeCell {
               return cell
               }
        
               return UITableViewCell()
    }
    
    
}


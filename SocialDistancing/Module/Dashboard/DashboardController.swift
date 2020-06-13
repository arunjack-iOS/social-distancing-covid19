//
//  DashboardController.swift
//  SocialDistancing
//
//  Created by Arun Jack on 01/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit
import Alamofire

class DashboardController: UIViewController {

    @IBOutlet weak var requestPassBtn: UIButton!
    @IBOutlet weak var dashboardTable: UITableView!
    @IBOutlet weak var msgLbl: UILabel!
    
    var myPass: [PassEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpTable()
        invokeMyPassAPI()
        messageLbl()
    }
    
    
    func setUpTable() {
        
        // dashboardTable.register(PassCell.self, forCellReuseIdentifier: String(describing: PassCell.self))
         
         dashboardTable.dataSource = self
         dashboardTable.delegate = self
        
         dashboardTable.tableFooterView = UIView()
         dashboardTable.estimatedRowHeight = 150
         dashboardTable.rowHeight = UITableView.automaticDimension

    }
    
    func messageLbl(_ text: String? = nil) {
        msgLbl.isHidden = true
        if myPass.count <= 0 {
            msgLbl.isHidden = false
        } else {
            msgLbl.text = ""
        }
        msgLbl.text = text ?? ""

    }
    
    func invokeMyPassAPI() {
        
        if let path = Bundle.main.path(forResource: "MyPass", ofType: "json") {
              let url=URL(fileURLWithPath: path)
        
            AF.request(url).response(completionHandler: { response in

                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let passes = try decoder.decode(PassData.self, from: data)
                    print(passes.passList)
                    self.myPass = passes.passList
                    self.dashboardTable.reloadData()
                    self.messageLbl("No Passes Found")
                } catch let error {
                    print(error)
                    self.messageLbl("Sorry, somthing went wrong")

                }

            })
        }
        

    }
    
    @IBAction func requestPassClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name:"RequestPass",bundle: Bundle.main)
        if let requestPassVC = storyboard.instantiateViewController(withIdentifier: "RequestPassViewController") as? RequestPassViewController {
            self.navigationController?.pushViewController(requestPassVC, animated: true)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PassCell.self), for: indexPath) as?  PassCell else {
            return UITableViewCell()
        }

        cell.configurePassCell(myPass[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"PassDetialScreen",bundle: Bundle.main)

        guard let dashNav = storyboard.instantiateViewController(withIdentifier: "PassDetialScreenIdentifier") as? PassDetialScreenVC else {
            fatalError("Invalid view controller type")
        }
        
        dashNav.passDataModel = myPass[indexPath.row]
        
        self.navigationController?.pushViewController(dashNav, animated: true)

    }
    
}


class DashboardWireFrame {
    
    class func assembleDashboard() -> UINavigationController {
        let storyboard = UIStoryboard(name:"Dashboard",bundle: Bundle.main)

        guard let dashNav = storyboard.instantiateViewController(withIdentifier: "DashboardNav") as? UINavigationController else {
            fatalError("Invalid view controller type")
        }
        return dashNav
    }
}

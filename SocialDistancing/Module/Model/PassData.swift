//
//  PassData.swift
//  SocialDistancing
//
//  Created by Arun Jack on 01/05/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import Foundation
import UIKit

struct PassEntity: Codable {
    var id: Int
    var name: String
    var status: String
    var purpose: String
    var phone: String
    var address: String
    var pincode: String
    var passNumber: String
    var slot: String

    enum CodingKeys: String, CodingKey {
        case id, name, status, purpose, phone, address, pincode, slot
        case passNumber = "passnumber"
    }
}


struct PassData: Codable {
    var passList: [PassEntity] = []

    enum CodingKeys: String, CodingKey {
              case passList = "mypasses"
    }
}


enum PassStatus: String {
    
    case PENDING = "Pending"
    case APPROVED = "Approved"
    case DENIED = "Denied"
    case NONE = "none"
    
    func getColor() -> UIColor? {
        switch self {
        case .PENDING:
            return UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        case .APPROVED:
            return UIColor(red: 36.0/255.0, green: 160.0/255.0, blue: 22.0/255.0, alpha: 1.0)
        case .DENIED:
            return UIColor(red: 255.0/255.0, green: 16.0/255.0, blue: 2.0/255.0, alpha: 1.0)

        default:
            return UIColor.black
        }
    }

}

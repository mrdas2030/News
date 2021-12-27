//
//  User.swift
//  fireBaseApp
//
//  Created by يوسف جابر المالكي on 17/05/1443 AH.
//

import Foundation

struct User {
    var id = ""
    var name = ""
    var imageUrl = ""
    var email = ""
    
    init(dict:[String:Any]) {
        if let id = dict["id"] as? String,
           let name = dict["name"] as? String,
           let imageUrl = dict["imageUrl"] as? String,
           let email = dict["email"] as? String {
            self.name = name
            self.id = id
            self.email = email
            self.imageUrl = imageUrl
        }
    }
}

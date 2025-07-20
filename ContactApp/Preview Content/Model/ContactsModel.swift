//
//  ContactsModel.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import Foundation
import Foundation
struct ContactsModel:Identifiable,Hashable{
    var id:UUID
    var name:String
    var lastName:String
    var email:String
    var initials:String{
        let first = name.prefix(1).capitalized
        let second = lastName.prefix(1).capitalized
        return "\(first)\(second)"
    }
}

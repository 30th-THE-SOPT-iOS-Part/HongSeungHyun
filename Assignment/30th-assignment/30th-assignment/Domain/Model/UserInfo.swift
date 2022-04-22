//
//  UserInfo.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import Foundation

struct UserInfo {
    static var shared: UserInfo = UserInfo()
    private init() {}
    
    var userId: String?
    var userPassword: String?
}

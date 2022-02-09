//
//  UserDetail.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseFirestoreSwift

struct UserDetail: Identifiable, Codable {
    let id: String
    let username: String
    var fullName: String?
    var avatar: String?
    var bio: String?
}

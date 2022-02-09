//
//  Like.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation

struct Like: Identifiable, Codable {
    let id: String
    let postId: String
    let userId: String
    let date: Date
}

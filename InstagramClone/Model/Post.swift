//
//  Post.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    let id: String
    let userId: String
    let publishedAt: Date
    let caption: String?
    let images: [String]?
}

//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    @Published var userDetails: UserDetail?
    @Published var posts: [Post] = []
    @Published var followers: [UserDetail] = []
    @Published var following: [UserDetail] = []
    @Published var isMyProfile: Bool = false
    
    let userId: String
    let db = Firestore.firestore()
    
    init(userId: String) {
        self.userId = userId
        self.getUserDetails(userId: userId)
    }
    
    init(){
        self.userId = Auth.auth().currentUser!.uid
        self.getUserDetails(userId: self.userId)
    }
    
    func getUserDetails(userId: String) {
        self.db.collection("users").document(userId).getDocument{doc, err in
            if let err = err {
                print(err)
            }else {
                do {
                    if let userDetails = try doc!.data(as: UserDetail.self) {
                        self.userDetails = userDetails
                        self.isMyProfile = userId == Auth.auth().currentUser!.uid
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

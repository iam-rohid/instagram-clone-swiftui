//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

final class PostViewModel: ObservableObject, Identifiable {
    let id: String
    @Published var post: Post
    @Published var publisher: UserDetail?
    @Published var likeCount: Int?
    @Published var like: Like?
    @Published var isMyPost: Bool = false
    
    private let db = Firestore.firestore()
    
    init(post: Post){
        self.id = post.id
        self.post = post
        self.fetchData()
        let userId = Auth.auth().currentUser!.uid
        self.isMyPost = post.userId == userId
    }
    
    func fetchData() {
        self.fetchPublisher()
        self.fetchLikeCount()
    }
    
    func fetchLikeCount() {
        let userId = Auth.auth().currentUser!.uid
        self.db.collection("likes").whereField("postId", isEqualTo: post.id).addSnapshotListener{snapshot, err in
            if let err = err {
                print(err.localizedDescription)
            }else {
                guard let docs = snapshot?.documents else {return}
                
                let likes: [Like] = docs.compactMap(){doc in
                    do {
                        return try doc.data(as: Like.self)
                    }catch {
                        return nil
                    }
                }
                self.like = nil
                likes.forEach(){like in
                    if like.userId == userId {
                        self.like = like
                    }
                }
                
                self.likeCount = docs.count
            }
        }
    }
    
    func fetchPublisher() {
        self.db.collection("users").whereField("id", isEqualTo: post.userId).getDocuments(){snapshot, err in
            if let err = err {
                print(err.localizedDescription)
            } else {
                guard let doc = snapshot?.documents.first else {return}
                do {
                    self.publisher = try doc.data(as: UserDetail.self)
                }catch {
                    print(error)
                }
            }
        }
    }
    
    func likePost() {
        let userId = Auth.auth().currentUser!.uid
        if let like = like {
            self.db.collection("likes").document(like.id).delete() { err in
                if let err = err {
                    print(err.localizedDescription)
                }
            }
        }else {
            let _like = Like(id: UUID().uuidString, postId: post.id, userId: userId, date: .now)
            do {
                try self.db.collection("likes").document(_like.id).setData(from: _like) {err in
                    if let err = err {
                        print(err.localizedDescription)
                    }
                }
            }catch {
                print(error)
            }
        }
    }
}

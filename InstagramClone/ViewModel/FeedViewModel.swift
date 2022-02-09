//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FeedViewModel: ObservableObject {
    @Published var postViewModels: [PostViewModel] = []
    private let db = Firestore.firestore()
    
    func getPosts() {
        db.collection("posts").getDocuments(){snapshot, err in
            if let err = err {
                print(err.localizedDescription)
            }else {
                guard let docs = snapshot?.documents else {return}
                self.postViewModels = docs.compactMap({ doc in
                    do {
                        let post = try doc.data(as: Post.self)
                        if let post = post {
                            return PostViewModel(post: post)
                        }else {
                            return nil
                        }
                    }catch {
                        return nil
                    }
                })
            }
        }
    }
}

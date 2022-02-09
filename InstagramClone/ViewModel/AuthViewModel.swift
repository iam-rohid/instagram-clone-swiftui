//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class AuthViewModel: ObservableObject {
    @Published var handle: AuthStateDidChangeListenerHandle?
    @Published var user: User?
    @Published var userDetail: UserDetail?
    @Published var loading = false
    
    private let db = Firestore.firestore()
    
    func addAuthStateChangeListener(){
        print("Listening to auth change...")
        self.loading = true
        self.handle = Auth.auth().addStateDidChangeListener{auth, user in
            
            if let user = user {
                self.db.collection("users").document(user.uid).getDocument{ doc, err in
                    if let err = err {
                        print(err.localizedDescription)
                    }else {
                        do {
                            self.userDetail = try doc!.data(as: UserDetail.self)
                        }catch {
                            print(error)
                        }
                        
                    }
                }
            }
            
            self.user = user
            self.loading = false
        }
    }
    
    func removeAuthStateChangeListener() {
        Auth.auth().removeStateDidChangeListener(self.handle!)
    }
    
    
}

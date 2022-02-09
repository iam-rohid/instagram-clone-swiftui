//
//  SignUpViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class SignUpViewModel: ObservableObject {
    @Published var usernameText = ""
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var confirmPasswordText = ""
    @Published var errorText: String?
    @Published var loading: Bool = false
    
    private let db = Firestore.firestore()
    
    func signUp() {
        if loading {
            return
        }
        
        self.errorText = nil
        
        if usernameText.isEmpty {
            self.errorText = "Please provide an username"
            return
        }
        
        if emailText.isEmpty {
            self.errorText = "Invalid email address"
            return
        }
        
        if passwordText.isEmpty {
            self.errorText = "Invalid Password"
            return
        }
        
        if passwordText.count < 4 {
            self.errorText = "Password must be at least 4 characters long"
            return
        }
        
        if confirmPasswordText.isEmpty || passwordText != confirmPasswordText {
            self.errorText = "Please confirm your password"
            return
        }
        
        self.loading = true
        
        Auth.auth().createUser(withEmail: emailText, password: passwordText){res, err in
            if err != nil {
                self.errorText = err?.localizedDescription
                self.loading = false
            }else {
                let userDetail = UserDetail(id: res!.user.uid, username: self.usernameText.lowercased())
                do {
                    _ = try self.db.collection("users").document(userDetail.id).setData(from: userDetail){err in
                        print(err?.localizedDescription ?? "")
                    }
                }catch {
                    
                }
                self.loading = false
            }
        }
    }
}

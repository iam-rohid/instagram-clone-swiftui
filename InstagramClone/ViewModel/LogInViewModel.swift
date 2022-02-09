//
//  LogInViewModel.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import Foundation
import FirebaseAuth

final class LogInViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var errorText: String?
    @Published var loading: Bool = false
    
    func logIn() {
        if loading {
            return
        }
        
        self.errorText = nil
        
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
        
        self.loading = true
        
        Auth.auth().signIn(withEmail: emailText, password: passwordText){res, err in
            if err != nil {
                self.errorText = err?.localizedDescription
                self.loading = false
            }else {
                print("Success")
                self.loading = false
            }
        }
    }
}

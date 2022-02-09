//
//  AuthView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import SwiftUI

struct AuthView: View {
    @StateObject var authVM = AuthViewModel()
    
    var body: some View {
        ZStack{
            if authVM.loading {
                ProgressView()
            }
            else if authVM.user != nil {
                HomeTabView()
            }else {
                NavigationView{
                    LogInView()
                }
            }
        }
        .onAppear {
            authVM.addAuthStateChangeListener()
        }
        .onDisappear {
            authVM.removeAuthStateChangeListener()
        }
        .environmentObject(authVM)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signUpVM: SignUpViewModel = SignUpViewModel()
    var body: some View {
        ScrollView {
            // MARK: Header
            HStack{
                Image("instagram-logo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 56)
                    .foregroundColor(Color(uiColor: .label))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 48)
            
            // MARK: Log In Form
            VStack(alignment: .leading, spacing: 20){
                Text("Create your Account")
                
                TextInputField(text: $signUpVM.usernameText, label: "Username")
                TextInputField(text: $signUpVM.emailText, label: "Email", type: .emailAddress)
                TextInputField(text: $signUpVM.passwordText, label: "Password", SecureText: true)
                TextInputField(text: $signUpVM.confirmPasswordText, label: "Confirm Password", SecureText: true)
                
                Button {
                    signUpVM.signUp()
                } label: {
                    ZStack{
                        if signUpVM.loading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }else{
                            Text("Sign Up")
                                .font(.headline.weight(.bold))
                        }
                    }
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }.disabled(signUpVM.loading)
            }
            .padding()
            
            // MARK: Submit Button
            HStack(alignment: .center, spacing: 10){
                Text("Already have an acount?")
                    .font(.body)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                NavigationLink {
                    LogInView()
                } label: {
                    Text("Log In")
                        .font(.body)
                        .foregroundColor(Color(uiColor: .label))
                }

            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        }
        .frame( maxWidth: .infinity, alignment: .leading)
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUpView()
        }
    }
}

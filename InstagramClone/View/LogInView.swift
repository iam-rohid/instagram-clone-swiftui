//
//  LogInView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct LogInView: View {
    @StateObject var logInVM: LogInViewModel = LogInViewModel()
    
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
                Text("Login to your Account")
                
                TextInputField(text: $logInVM.emailText, label: "Email", type: .emailAddress)
                TextInputField(text: $logInVM.passwordText, label: "Password", SecureText: true)
                
                if let error = logInVM.errorText {
                    Text(error)
                }
                // MARK: Submit Button
                Button {
                    logInVM.logIn()
                } label: {
                    ZStack{
                        if logInVM.loading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }else{
                            Text("Log in")
                                .font(.headline.weight(.bold))
                        }
                    }
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }.disabled(logInVM.loading)
            }
            .padding()
            
            
            HStack(alignment: .center, spacing: 10){
                Text("Don't have an acount?")
                    .font(.body)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Sign Up")
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LogInView()
        }
    }
}

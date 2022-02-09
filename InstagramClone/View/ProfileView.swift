//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileVM: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            if profileVM.isMyProfile {
                header
            }
            ScrollView(showsIndicators: false){
                if profileVM.userDetails != nil {
                    userInfo
                }else {
                    ProgressView()
                }
            }
        }
        .navigationTitle(profileVM.userDetails?.username ?? "Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(profileVM.isMyProfile)
    }
    
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 0){
                CircleAvatar(imgUrl: profileVM.userDetails?.avatar, radius: 44)
                VStack(alignment: .center, spacing: 0){
                    Text("\(profileVM.posts.count)")
                        .font(.title3)
                    Text("Posts")
                }
                .frame(maxWidth: .infinity)
                VStack(alignment: .center, spacing: 0){
                    Text("\(profileVM.posts.count)")
                        .font(.title3)
                    Text("Followers")
                }
                .frame(maxWidth: .infinity)
                VStack(alignment: .center, spacing: 0){
                    Text("\(profileVM.posts.count)")
                        .font(.title3)
                    Text("Following")
                }
                .frame(maxWidth: .infinity)
            }
            if let fullName = profileVM.userDetails?.fullName {
                Text(fullName)
                    .font(.headline)
            }else if let username = profileVM.userDetails?.username {
                Text("@\(username)")
                    .font(.headline)
            }
            if let bio = profileVM.userDetails?.bio {
                Text(bio)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(5)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 32)
    }
    var header: some View {
        HStack(alignment: .center, spacing: 20){
            Text(profileVM.userDetails?.username ?? "no_user")
                .font(.title2.weight(.bold))
            
            Spacer()
            
            // MARK: Actions
            Button {
                
            } label: {
                Image(systemName: "plus.app")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .background(Color(uiColor: .systemBackground))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


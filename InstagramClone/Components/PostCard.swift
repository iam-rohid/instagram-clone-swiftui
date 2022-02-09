//
//  PostCard.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct PostCard: View {
    @StateObject var postViewModel: PostViewModel
    
    var body: some View {
        VStack(spacing: 0){
            if postViewModel.publisher == nil {
                headerPlaceHolder
            }else {
                header
            }
            
            // MARK: Post Image
            if let imgUrl = postViewModel.post.images?[0] {
                AsyncImage(url: URL(string: imgUrl)){image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    VStack{
                        Image(systemName: "photo")
                            .font(.system(size: 48))
                            .foregroundColor(Color(uiColor: .tertiaryLabel))
                    }
                    .frame(height: UIScreen.main.bounds.width)
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .secondarySystemBackground))
                }
            }
            
            actionButtons
        }.background(Color(uiColor: .systemBackground))
    }
    
    var headerPlaceHolder: some View {
        HStack(spacing: 10){
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: 120, height: 20)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: 40, height: 20)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
            Spacer()
            Circle()
                .frame(width: 32, height: 32)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
        }
        .padding(10)
    }
    
    var header: some View {
        HStack(spacing: 10){
            NavigationLink(destination: {
                ProfileView(profileVM: ProfileViewModel(userId: postViewModel.post.userId))
            }, label: {
                CircleAvatar(imgUrl: postViewModel.publisher?.avatar, radius: 16)
                if let publisher = postViewModel.publisher {
                    Text("@\(publisher.username)")
                        .font(.headline)
                        .foregroundColor(Color(uiColor: .label))
                }
            })
            
            if !postViewModel.isMyPost {
                Text("•")
                    .font(.headline)
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.headline.weight(.medium))
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
        }
        .padding(10)
    }
    
    
    var actionButtons: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 20){
                Button {
                    postViewModel.likePost()
                } label: {
                    Image(systemName: postViewModel.like != nil ? "heart.fill" : "heart")
                        .font(.system(size: 24))
                        .foregroundColor(postViewModel.like != nil ? Color.accentColor : Color(uiColor: .label))
                }
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .font(.system(size: 24))
                        .foregroundColor(Color(uiColor: .label))
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 24))
                        .foregroundColor(Color(uiColor: .label))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color(uiColor: .label))
                }
            }
            
            if let likes = postViewModel.likeCount {
                Text("\(likes) Likes")
                    .font(.headline)
            } else {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .frame(width: 80, height: 20)
                    .foregroundColor(Color(uiColor: .secondarySystemBackground))
            }
            
            if let publisher = postViewModel.publisher {
                Text("@\(publisher.username)").font(.headline) +
                Text(" \(postViewModel.post.caption ?? "")")
            }
        }
        .padding(10)
    }
}

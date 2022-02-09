//
//  FeedView.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI
import FirebaseAuth

struct FeedView: View {
    @StateObject var feedVM = FeedViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            navigationBar
            ScrollView (showsIndicators: false){
                storyList
                LazyVStack{
                    ForEach(feedVM.postViewModels, id: \.id){postVM in
                        PostCard(postViewModel: postVM)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            feedVM.getPosts()
        }
    }
    
    var navigationBar: some View {
        HStack(alignment: .center, spacing: 20){
            Image("instagram-logo")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(uiColor: .label))
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
            Button {
                
            } label: {
                Image(systemName: "message")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
            
            Button {
                do {
                    try Auth.auth().signOut()
                } catch {
                    print("Failed to log out")
                }
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 24))
                    .foregroundColor(Color(uiColor: .label))
            }
        }
        .frame(height: 48)
        .padding(.horizontal, 10)
    }
    
    var storyList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20){
                StoryCircle()
                    .overlay(
                        VStack{
                            Image(systemName: "plus")
                                .font(.body.weight(.bold))
                                .foregroundColor(.white)
                        }
                            .frame(width: 24, height: 24, alignment: .center)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color(uiColor: .systemBackground), lineWidth: 3)
                            )
                            .offset(x: 20, y: 20)
                    )
                ForEach(0 ..< 10){ i in
                    StoryCircle()
                }
            }.padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

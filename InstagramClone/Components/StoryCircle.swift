//
//  StoryCircle.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct StoryCircle: View {
    var radius: CGFloat = 28
    
    var body: some View {
        Button{
            
        }label: {
            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80")){image in
                image
                    .resizable()
                    .frame(width: radius * 2, height: radius * 2)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(AngularGradient(colors: [Color.red, Color.yellow, Color.red], center: .center), lineWidth: 2)
                            .foregroundColor(.clear)
                            .frame(width: (radius * 2) + 8, height: (radius * 2) + 8)
                            .rotationEffect(Angle(degrees: -45))
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: radius * 2, height: radius * 2)
            }
        }
        
    }
}

struct StoryCircle_Previews: PreviewProvider {
    static var previews: some View {
        StoryCircle()
    }
}

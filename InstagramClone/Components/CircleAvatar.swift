//
//  CircleAvatar.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 21/1/22.
//

import SwiftUI

struct CircleAvatar: View {
    let imgUrl: String?
    let radius: CGFloat

    init(imgUrl: String? = nil, radius: CGFloat = 32) {
        self.radius = radius
        self.imgUrl = imgUrl
    }
    
    var body: some View {
        ZStack{
            if let imageUrl = imgUrl {
                AsyncImage(url: URL(string: imageUrl)){image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }placeholder: {
                    ProgressView()
                }
            }else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .frame(width: radius * 2, height: radius * 2)
        .clipShape(Circle())
    }
}

struct CircleAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatar()
    }
}

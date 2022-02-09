//
//  TextInputField.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI

struct TextInputField: View {
    @FocusState var focused: Bool
    @Binding var text: String
    var label: String
    var SecureText: Bool = false
    var type: UIKeyboardType = .default
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color(uiColor: .tertiaryLabel))
                .padding(.horizontal, 6)
                .background(focused || !text.isEmpty ? Color(uiColor: .systemBackground) : Color(uiColor: .systemBackground).opacity(0))
                .padding(.horizontal, 10)
                .font(.system(size: 18))
                .offset(y: (focused || !text.isEmpty) ? -30 : 0)
                .scaleEffect((focused || !text.isEmpty) ? 0.8 : 1, anchor:  .leading)
                .animation(.easeInOut(duration: 0.2))
            
            if SecureText {
                SecureField("", text: $text)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .focused($focused)
                    .keyboardType(.default)
            }else {
                TextField("", text: $text)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .focused($focused)
                    .keyboardType(type)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color(uiColor: .separator), lineWidth: 1)
        )
    }
}

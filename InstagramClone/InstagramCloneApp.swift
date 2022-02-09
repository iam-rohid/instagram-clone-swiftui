//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Rohidul Islam on 20/1/22.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}

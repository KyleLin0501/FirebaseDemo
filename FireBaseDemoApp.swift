//
//  FireBaseDemoApp.swift
//  FireBaseDemo
//
//  Created by 林楷祐 on 2024/4/30.
//

import SwiftUI
import Firebase

@main
struct FireBaseDemoApp: App {
    @State var isLogin = false
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if isLogin == false {
                ContentView(isLogin: $isLogin)
            }
            else {
                HomeView()
            }
        }
    }
}





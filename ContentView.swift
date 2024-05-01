//
//  ContentView.swift
//  FireBaseDemo
//
//  Created by 林楷祐 on 2024/4/30.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isLogin: Bool
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors:[.red,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            VStack (spacing: 20){
                Text("Welcome")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 40,weight: .bold,design: .rounded))
                    .offset(x:-100,y:-100)
                
                TextField("",text: $email,prompt:Text("Email").foregroundColor(.white))
                    .foregroundStyle(Color.white)
                    .textFieldStyle(.plain)
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.white)
                    .frame(height: 1)
                
                SecureField("",text: $password,prompt:Text("Password").foregroundColor(.white))
                    .foregroundStyle(Color.white)
                    .textFieldStyle(.plain)
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.white)
                    .frame(height: 1)
                
                
                HStack {
                    Button(action: {
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            guard let user = result?.user,
                            error == nil else {
                                print(error ?? "")
                                return
                            }
                            print(user.uid)
                        }
                    }, label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 150,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .continuous)
                                    .fill(.linearGradient(colors: [.red,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                    })
                    .padding(.top)
                    .offset(y:100)
                    
                    
                    Button(action: {
                        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                            guard error == nil else {
                                print(error ?? "")
                                return
                            }
                            isLogin = true
                        }
                    }, label: {
                        Text("Login")
                            .bold()
                            .frame(width: 150,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .continuous)
                                    .fill(.linearGradient(colors: [.red,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                    })
                    .padding(.top)
                    .offset(y:100)
                    
                }
                
               
            }
            .frame(width: 350)
            .foregroundColor(.white)
        }
        .onAppear() {
            if let user = Auth.auth().currentUser {
                isLogin = true
                print("user:",user)
                
            }
        }
    }
}


#Preview {
    ContentView(isLogin: .constant(true))
}

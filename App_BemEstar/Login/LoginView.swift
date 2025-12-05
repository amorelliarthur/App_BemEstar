//
//  LoginView.swift
//  App_BemEstar
//
//  Created by user288583 on 12/5/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUser = 0
    @State private var wrongPass = 0
    @State private var showHomeScreen = false

    @available(*, deprecated)
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.3))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.7))

                VStack {
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUser))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPass))
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.teal)
                    .cornerRadius(30)

                    NavigationLink(
                        destination: ContentView(),
                        isActive: $showHomeScreen
                    ) {
                        EmptyView()
                    }.hidden()
                }
            }
        }

    }

    func authenticateUser(username: String, password: String) {
        // Combina usuários iniciais + salvos
        let savedUsers = LoginStorage.loadUsers()
        let allUsers = mockUsers + savedUsers

        guard let user = allUsers.first(where: { $0.username == username }) else {
            wrongUser = 2
            return
        }

        wrongUser = 0
        let hashedAttempt = LoginType.sha256(password)
        if hashedAttempt == user.passwordHash {
            wrongPass = 0
            showHomeScreen = true
        } else {
            wrongPass = 2
        }
    }
}

#Preview {
    LoginView()
}
